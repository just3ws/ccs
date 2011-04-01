# == Schema Information
#
# Table name: users
#
#  id                   :integer         not null, primary key
#  email                :string(255)     default(""), not null
#  encrypted_password   :string(128)     default("")
#  password_salt        :string(255)     default("")
#  reset_password_token :string(255)
#  remember_token       :string(255)
#  remember_created_at  :datetime
#  sign_in_count        :integer         default(0)
#  current_sign_in_at   :datetime
#  last_sign_in_at      :datetime
#  current_sign_in_ip   :string(255)
#  last_sign_in_ip      :string(255)
#  created_at           :datetime
#  updated_at           :datetime
#  role                 :string(255)     default("guest")
#  submissions_id       :integer
#  home_page            :string(255)
#  first_name           :string(255)
#  last_name            :string(255)
#  biography            :text
#  avatar_file_name     :string(255)
#  avatar_content_type  :string(255)
#  avatar_file_size     :integer
#  avatar_updated_at    :datetime
#  confirmation_token   :string(255)
#  confirmed_at         :datetime
#  confirmation_sent_at :datetime
#  invitation_token     :string(20)
#  invitation_sent_at   :datetime
#  speakerrate          :string(2048)
#  twitter              :string(32)
#

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

  devise :invitable,
         :database_authenticatable,
         :registerable,
         :confirmable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable

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

