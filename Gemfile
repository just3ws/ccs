source 'http://rubygems.org'

gem 'rails'

gem 'sqlite3-ruby'
gem 'heroku'
gem 'json'

gem "asset-resource"

gem 'dalli'

gem 'resque'
gem 'sitemap_generator', :git => 'git://github.com/just3ws/sitemap_generator.git', :branch => 'heroku'

group :production do
  gem 'pg'
end

gem 'devise'
gem 'devise_invitable'
gem 'cancan'

gem 'formtastic'
gem 'compass'
gem 'jquery-rails', '>= 0.2.6'
gem 'haml'

gem 'aws-s3', :require => 'aws/s3'
gem 'paperclip'

group :development, :test do
  gem 'thin'
  gem 'cucumber'
  gem 'cucumber-rails'
  gem 'rspec'
  gem 'rspec-rails'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'pickle'
  gem 'fuubar'
  gem 'fuubar-cucumber'
  gem 'autotest'
  gem 'autotest-growl'
  gem 'autotest-fsevent'
  gem 'rails_best_practices'
  gem 'annotate'
end

group :development do
  gem 'wirble'
  gem 'awesome_print'
end

