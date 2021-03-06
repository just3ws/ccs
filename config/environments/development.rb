CACHE_CONTROL__MAX_AGE = 0

Ccs::Application.configure do
  require File.expand_path("lib/heroku_settings")
  HerokuSettings.load_env_from_config

  # Settings specified here will take precedence over those in config/application.rb

  # In the development environment your application's code is reloaded on
  # every request.  This slows down response time but is perfect for development
  # since you don't have to restart the webserver when you make code changes.
  config.cache_classes = false

  # Log error messages when you accidentally call methods on nil.
  config.whiny_nils = true

  # Show full error reports and disable caching
  config.consider_all_requests_local = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin

  config.action_mailer.default_url_options = {:host => 'localhost:3000'}

  config.after_initialize do
    Bullet.enable                = false
    Bullet.bullet_logger         = false
    Bullet.console               = false
    Bullet.rails_logger          = false
    Bullet.disable_browser_cache = false
  end
end

