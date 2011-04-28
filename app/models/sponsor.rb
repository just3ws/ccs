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

# == Schema Information
#
# Table name: sponsors
#
#  id                   :integer         primary key
#  name                 :string(255)
#  contact_name         :string(255)
#  description          :text
#  home_page            :string(255)
#  sponsorship_level_id :integer
#  email                :string(255)
#  created_at           :timestamp
#  updated_at           :timestamp
#  logo_file_name       :string(255)
#  logo_content_type    :string(255)
#  logo_file_size       :integer
#  logo_updated_at      :datetime
#

