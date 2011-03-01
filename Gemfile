source 'http://rubygems.org'

# ah-yup.
gem 'rails'
gem 'sqlite3-ruby'

# app server
gem 'unicorn'

# our beloved host
gem 'heroku'

# well. json
gem 'json'

# memcached library
gem 'dalli'

# background jobs
gem 'SystemTimer'
gem 'resque'

# generate a sitemap and ping search servics to get indexed
gem 'sitemap_generator', :git => 'git://github.com/just3ws/sitemap_generator.git', :branch => 'heroku'

group :production do
  gem 'pg'
end

# authentication
gem 'devise'

# generating users
gem 'devise_invitable'

# authorization permissions
gem 'cancan'

# for SCSS
gem 'compass'

# using jQuery instead of prototype/scriptaculous
gem 'jquery-rails', '>= 0.2.6'

# cleaner HTML
gem 'haml'

# for Amazon Web Service (S3)
gem 'aws-s3', :require => 'aws/s3'

# for dealing with physical files
gem 'paperclip'

group :development, :test do
  # simplify management of heroku environments 
  gem 'heroku_san'

  # given/when/then
  gem 'cucumber'
  gem 'cucumber-rails'

  # it should
  gem 'rspec'
  gem 'rspec-rails'

  # automate the ui
  gem 'capybara'

  # cleans the database after tests
  gem 'database_cleaner'
  
  # And show me the page
  gem 'launchy'

  # model building
  gem 'pickle'

  # much improved test progress and fail-fast
  gem 'fuubar'
  gem 'fuubar-cucumber'

  # understand hotspots in the codebase
  gem 'rails_best_practices'

  # adds attribute and type docs to models and routes
  gem 'annotate'

  # run tests automatically
  gem "ZenTest"
  gem "autotest-rails-pure"
  gem "autotest-growl"
  gem "autotest-fsevent" 
end

group :development do
  # improve Irb
  gem 'wirble'

  # better than pp
  gem 'awesome_print'
end

