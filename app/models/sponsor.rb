class Sponsor < ActiveRecord::Base
  belongs_to :sponsorship_level 

  has_attached_file :logo,
    :bucket => S3Settings.bucket,
    :storage => :s3,
    :s3_credentials => {:access_key_id => ENV['S3_KEY'] || S3Settings.settings[:access_key_id],
      :secret_access_key => ENV['S3_SECRET'] || S3Settings.settings[:secret_access_key]},
      :path => "/:style/:filename",
      :styles => {
        :thumb => ["320x320>", :png]
      }

end
