#!/bin/bash
set -e

# Ensure Bundler respects the correct Ruby path
export PATH="/usr/local/bundle/bin:$PATH"

echo "===> Waiting for Postgres..."
until nc -z db 5432; do
	sleep 1
done
echo "✓ Postgres ready."

# Rails environment detection
RAILS_ENV="${RAILS_ENV:-development}"

echo "===> Environment: $RAILS_ENV"

case "$RAILS_ENV" in
development)
	echo "===> Running migrations (dev)..."
	bundle exec rake db:migrate || true
	;;
test)
	echo "===> Preparing test DB..."
	bundle exec rake db:drop db:create db:migrate --trace
	;;
production)
	echo "===> Running migrations (prod)..."
	bundle exec rake db:migrate
	;;
esac

echo "===> Starting application..."
exec "$@"
