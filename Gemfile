source 'http://rubygems.org'

# ah-yup.
gem 'rails'
gem 'sqlite3-ruby'

# our beloved host
gem 'heroku'

# error tracking
gem 'hoptoad_notifier'

# well. json
gem 'json'

# memcached library
gem 'dalli'

# background jobs
gem 'delayed_job'

# searching
gem 'indextank'
gem 'json_pure'

# csv processing
gem 'fastercsv'

# generate a sitemap and ping search servics to get indexed
gem 'sitemap_generator', :git => 'git://github.com/just3ws/sitemap_generator.git', :branch => 'heroku'

# authentication
gem 'devise'

# generating users
gem 'devise_invitable'

# authorization permissions
gem 'cancan'

# form generation
gem 'formtastic'

# using jQuery instead of prototype/scriptaculous
gem 'jquery-rails', '>= 0.2.6'

# cleaner HTML
gem 'haml'

# for Sass 
gem 'sass'
gem 'compass'

# javascript
gem 'coffee-script'

# textile support for user defined content
gem 'rdiscount'

# for Amazon Web Service (S3)
gem 'aws-s3', :require => 'aws/s3'

# for dealing with physical files
gem 'paperclip'

group :test do
  # given/when/then
  gem 'gherkin'
  gem 'cucumber'
  gem 'cucumber-rails'

  # factories
  gem 'factory_girl_rails'

  # automate the ui
  gem 'capybara'

  # cleans the database after tests
  gem 'database_cleaner'
  
  # And show me the page
  gem 'launchy'

  # much improved test progress and fail-fast
  gem 'fuubar'
  gem 'fuubar-cucumber'

  # run tests automatically
  gem 'watchr'

  # javascript testing
  gem 'jasmine'
end

group :test, :development do
  # it should
  gem 'rspec-core'
  gem 'rspec'
  gem 'rspec-rails'

  gem 'ruby-debug'
end

group :development do
  # simplify management of heroku environments 
  gem 'heroku_san'

  # improve Irb
  gem 'wirble'

  # better than pp
  gem 'awesome_print'

  # vi in your irb
  gem 'interactive_editor'

  # should make things faster
  gem 'rails-dev-boost', :git => 'git://github.com/thedarkone/rails-dev-boost.git', :require => 'rails_development_boost'

  # understand hotspots in the codebase
  gem 'rails_best_practices'

  # adds attribute and type docs to models and routes
  gem 'annotate'

  # generate ERD
  gem "rails-erd"

  # query watcher
  gem 'bullet'
end

