class User < ActiveRecord::Base
  has_many :submissions, :foreign_key => "user_id"
  validates :email, :presence => true,
            :length => {:within => 0..255},
            :email_domain => true,
            :email_format => true
  validates :first_name, :length => {:within => 0..255}, :allow_blank => true
  validates :last_name, :length => {:within => 0..255}, :allow_blank => true
  validates :home_page, :length => {:within => 0..512}, :allow_blank => true
  validates :twitter, :length => {:within => 0..32}, :allow_blank => true
  validates :speakerrate, :length => {:within => 0..2048}, :allow_blank => true

  has_attached_file :avatar,
                    :bucket => S3Settings.bucket,
                    :storage => :s3,
                    :s3_credentials => {:access_key_id => ENV['S3_KEY'] || S3Settings.settings[:access_key_id],
                                        :secret_access_key => ENV['S3_SECRET'] || S3Settings.settings[:secret_access_key]},
                    :path => "/:style/:filename"

  devise :invitable, :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :first_name, :last_name, :home_page, :biography, :role,
                  :speakerrate, :twitter

  ROLES = %w[guest attendee speaker admin]

  def admin?
    role? :admin
  end

  def role?(base_role)
    ROLES.index(base_role.to_s) <= ROLES.index(role)
  end

  def full_name
    names = []
    names << last_name unless last_name.blank?
    names << first_name unless first_name.blank?
    names.compact.join(', ')
  end
end
