class Submission < ActiveRecord::Base
  belongs_to :user

  validates :title, :presence => true, :length => {:within => 0..64}
  validates :abstract, :presence => true, :length => {:within => 0..1024}
  validates :email, :presence => true,
            :length           => {:within => 0..255},
            :email_domain     => true,
            :email_format     => true
  validates :first_name, :presence => true, :length => {:within => 0..255}
  validates :last_name, :presence => true, :length => {:within => 0..255}
  validates :home_page, :presence => true, :length => {:within => 0..512}
  validates :biography, :presence => true, :length => {:within => 0..1024}
  has_attached_file :avatar,
                    :bucket         => 'chicagocodecamp',
                    :storage        => :s3,
                    :s3_credentials => {:access_key_id     => ENV['S3_KEY'] || S3Settings.settings[:access_key_id],
                                        :secret_access_key => ENV['S3_SECRET'] || S3Settings.settings[:secret_access_key]},
                    :path           => "/:style/:filename"
end
