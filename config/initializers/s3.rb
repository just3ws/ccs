require 's3_settings'

AWS::S3::Base.establish_connection!(
  :access_key_id     => ENV['S3_KEY']    || S3Settings.settings[:access_key_id],
  :secret_access_key => ENV['S3_SECRET'] || S3Settings.settings[:secret_access_key]
)
