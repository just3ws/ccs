CACHE_CONTROL__MAX_AGE = 9600

Ccs::Application.configure do
  config.cache_classes = true
  config.consider_all_requests_local = false
  config.action_controller.perform_caching = true
  config.action_dispatch.x_sendfile_header = "X-Sendfile"
  config.cache_store = :dalli_store, ENV['MEMCACHE_SERVERS'] || 'localhost',
    { :namespace => ENV['MEMCACHE_NS'] || 'ccs', :expires_in => 1.day, :compress => true, :compress_threshold => 64*1024 }
  config.serve_static_assets = false
  config.i18n.fallbacks = true
  config.active_support.deprecation = :notify
  config.action_mailer.default_url_options = {:host => ENV['ROOT_URL']}
end

Sass::Plugin.options[:never_update] = true
