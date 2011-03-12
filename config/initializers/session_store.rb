# Be sure to restart your server when you modify this file.

# Ccs::Application.config.session_store :cookie_store, :key => '_ccs_session'

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rails generate session_migration")
# Ccs::Application.config.session_store :active_record_store

if %w(staging production).include? Rails.env
  require 'action_dispatch/middleware/session/dalli_store'
  Rails.application.config.session_store :dalli_store, :memcache_server => [ENV['MEMCACHE_SERVERS'] || 'localhost'], :namespace => 'sessions', :key => '_foundation_session', :expire_after => 30.minutes
end

