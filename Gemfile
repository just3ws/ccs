source 'http://rubygems.org'

# ah-yup.
gem 'rails'          , '3.0.11'
gem 'activerecord'   , '3.0.11'
gem 'actionmailer'   , '3.0.11'
gem 'actionpack'     , '3.0.11'
gem 'activeresource' , '3.0.11'
gem 'activesupport'  , '3.0.11'
gem 'railties'       , '3.0.11'

gem 'arel'
gem 'rake'

gem 'activeadmin'

# captcha for comments
#gem "recaptcha", :require => "recaptcha/rails"

# postgresql
gem 'pg'

gem 'thin'
gem 'foreman'

# our beloved host
gem 'heroku'

# well. json
gem 'json'

# memcached library
gem 'dalli'

# generate a sitemap and ping search servics to get indexed
#gem 'sitemap_generator'

# authentication
gem 'devise', "~>1"

# generating users
gem 'devise_invitable', "~>0.6"

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
gem 'compass' #, :git => "git://github.com/chriseppstein/compass.git", :branch => "master"

# javascript
# gem 'coffee-script'

# textile support for user defined content
gem 'rdiscount'

# for Amazon Web Service (S3)
gem 'aws-sdk' #, :require => 'aws/s3'

# for dealing with physical files
gem 'paperclip'

group :test do
 # given/when/then
 gem 'cucumber-rails'

 # factories
 gem 'factory_girl_rails'

 # automate the ui
 gem 'capybara'

 # cleans the database after tests
 gem 'database_cleaner'

 # And show me the page
 gem 'launchy'

 # javascript testing
 # gem 'jasmine'

 # it should
 gem 'rspec-rails'

 gem 'simplecov', :require => false
 gem 'simplecov-rcov'
end

group :development do
  gem 'sqlite3-ruby', :require => 'sqlite3'
  gem 'taps'
  gem 'ruby-debug19'
  gem 'pry'

  # simplify management of heroku environments
  gem 'heroku_san'

  # improve Irb
  gem 'wirble'

  # better than pp
  gem 'awesome_print'

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

  # find's dead routes
  gem 'traceroute'
end
