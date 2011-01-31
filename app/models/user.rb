class User < ActiveRecord::Base
  has_many :submissions, :foreign_key => "user_id"
  validates :email, :presence => true,
            :length           => {:within => 0..255},
            :email_domain     => true,
            :email_format     => true unless Proc.new{|submission| submission.user.blank?} 
  validates :first_name, :presence => true, :length => {:within => 0..255} unless Proc.new{|submission| submission.user.blank?}
  validates :last_name, :presence => true, :length => {:within => 0..255} unless Proc.new{|submission| submission.user.blank?}
  validates :home_page, :presence => true, :length => {:within => 0..512} unless Proc.new{|submission| submission.user.blank?}
  validates :biography, :presence => true, :length => {:within => 0..1024} unless Proc.new{|submission| submission.user.blank?}
  has_attached_file :avatar,
                    :bucket         => 'chicagocodecamp',
                    :storage        => :s3,
                    :s3_credentials => {:access_key_id     => ENV['S3_KEY'] || S3Settings.settings[:access_key_id],
                                        :secret_access_key => ENV['S3_SECRET'] || S3Settings.settings[:secret_access_key]},
                    :path           => "/:style/:filename"

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :first_name, :last_name, :home_page, :biography, :role

  ROLES = %w[guest attendee speaker admin]

  def admin?
    role? :admin
  end

  def role?(base_role)
    ROLES.index(base_role.to_s) <= ROLES.index(role)
  end
end
