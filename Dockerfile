FROM ubuntu:14.04

ENV DEBIAN_FRONTEND=noninteractive

# ---- Bundler/Ruby install paths ----
ENV BUNDLE_PATH=/usr/local/bundle
ENV BUNDLE_APP_CONFIG=/usr/local/bundle
ENV BUNDLE_BIN=/usr/local/bundle/bin
ENV GEM_HOME=/usr/local/bundle
ENV PATH="${BUNDLE_BIN}:${PATH}"

# ---- System deps ----
RUN apt-get update -qq && apt-get install -y \
  build-essential \
  curl \
  git-core \
  libssl-dev \
  libreadline-dev \
  zlib1g-dev \
  libsqlite3-dev \
  libxml2-dev \
  libxslt1-dev \
  libyaml-dev \
  sqlite3 \
  imagemagick \
  libmagickwand-dev \
  libpq-dev \
  postgresql-client \
  && rm -rf /var/lib/apt/lists/*

# ---- Ruby 1.9.3 (source compile) ----
WORKDIR /tmp
RUN curl -L https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p551.tar.gz -o ruby.tar.gz && \
    tar -xzf ruby.tar.gz && \
    cd ruby-1.9.3-p551 && \
    ./configure --disable-install-doc --with-opt-dir=/usr && \
    make && \
    make install

# ---- Bundler ----
RUN gem install bundler -v "~>1.17"

WORKDIR /app

# ---- Dependency layer (FAST rebuilds) ----
COPY Gemfile Gemfile.lock /app/
RUN bundle install

# ---- App code ----
COPY . /app

# ---- Entrypoint ----
COPY docker/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

EXPOSE 3000

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
