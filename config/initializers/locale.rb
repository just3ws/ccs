# https://github.com/svenfuchs/i18n-active_record

# I18n.backend = I18n::Backend::ActiveRecord.new

# if %w(staging production).include? Rails.env
#   I18n::Backend::ActiveRecord.send(:include, I18n::Backend::Cache)
#   I18n.cache_store = ActiveSupport::Cache.lookup_store(:dalli_store)
# end
