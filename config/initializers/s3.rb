AWS::S3::Base.establish_connection!(
        :access_key_id => S3Settings.access_key_id,
        :secret_access_key => S3Settings.secret_access_key
)
