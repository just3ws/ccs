SHELL := /bin/bash

# Compose service names (from docker-compose.yml)
SERVICE_APP   := ccs
SERVICE_DB    := db
SERVICE_CACHE := cache

# Container names (explicit)
APP   := ccs_app
DB    := ccs_db
CACHE := ccs_cache

DC := docker compose

.DEFAULT_GOAL := help

help:
	@echo ""
	@echo "CCS Development Makefile"
	@echo "------------------------"
	@echo " make clean-start     - Full rebuild, reset DB, seed, start server"
	@echo " make up              - Start all services"
	@echo " make down            - Stop all services"
	@echo " make sh              - Shell into app container"
	@echo " make rails c         - Rails console"
	@echo " make db-shell        - psql into DB"
	@echo " make reset-db        - Drop + create + migrate + seed"
	@echo " make migrate         - Run migrations"
	@echo " make seed            - Run seeds"
	@echo " make logs            - Tail app logs"
	@echo ""

# ---------------------------------------------
# Helpers
# ---------------------------------------------

# Run arbitrary Rails commands inside the app container
rails:
	@docker exec -it $(APP) bash -lc "RAILS_ENV=development bundle exec rails $(filter-out $@,$(MAKECMDGOALS))"

# Migration helper
rake:
	@docker exec -it $(APP) bash -lc "RAILS_ENV=development bundle exec rake $(filter-out $@,$(MAKECMDGOALS))"

# ---------------------------------------------
# Lifecycle
# ---------------------------------------------

build:
	$(DC) build

up:
	$(DC) up --build -d

down:
	$(DC) down

logs:
	$(DC) logs -f $(APP)

sh:
	docker exec -it $(APP) bash

db-shell:
	docker exec -it $(DB) psql -U postgres ccs_dev

# ---------------------------------------------
# Database Management
# ---------------------------------------------

reset-db:
	@echo "🧨 Dropping and recreating DB..."
	docker exec -it $(APP) bash -lc "bundle exec rake db:drop db:create"

	# @echo "📥 Loading schema.rb..."
	# docker exec -it $(APP) bash -lc "bundle exec rake db:schema:load"

	@echo "📥 Migrating..."
	docker exec -it $(APP) bash -lc "bundle exec rake db:migrate"

	@echo "🌱 Seeding..."
	docker exec -it $(APP) bash -lc "bundle exec rake db:seed"

migrate:
	docker exec -it $(APP) bash -lc "bundle exec rake db:migrate"

db-load:
	docker exec -it $(APP) bash -lc "bundle exec rake db:schema:load"

seed:
	docker exec -it $(APP) bash -lc "bundle exec rake db:seed"

# ---------------------------------------------
# Full Clean Start (safe, idempotent)
# ---------------------------------------------

clean-start:
	@echo "🔥 Resetting environment..."
	$(DC) down -v

	@echo "🔨 Rebuilding images..."
	$(DC) build

	@echo "🚀 Starting DB + Cache..."
	$(DC) up -d $(SERVICE_DB) $(SERVICE_CACHE)

	@echo "⏳ Waiting for Postgres..."
	@until docker exec $(DB) pg_isready -U postgres >/dev/null 2>&1; do \
		printf "."; \
		sleep 1; \
	done
	@echo " ✓ Postgres ready."

	@echo "📦 Starting app container..."
	$(DC) up -d $(SERVICE_APP)

	@echo "🗂 Running migrations + seeds..."
	$(MAKE) reset-db

	@echo "🌞 Environment ready!"
