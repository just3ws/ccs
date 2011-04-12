class User < ActiveRecord::Base
  has_many :submissions, :foreign_key => "user_id"
  has_many :sesja, :foreign_key => "user_id"
  validates :email, :presence => true,
    :length => {:within => 0..255},
    :email_domain => true,
    :email_format => true
  validates :first_name, :length => {:within => 0..255}, :allow_blank => true
  validates :last_name, :length => {:within => 0..255}, :allow_blank => true
  validates :home_page, :length => {:within => 0..512}, :allow_blank => true
  validates :twitter, :length => {:within => 0..32}, :allow_blank => true
  validates :speakerrate, :length => {:within => 0..2048}, :allow_blank => true

  before_save :set_permalink, :seoize_permalink

  scope :speakers, :conditions => { :role => "speaker" } 
  scope :with_rsvped_sessions, joins(:sesja).where("sesjas.user_id is not null and sesjas.rsvped_at is not null")
  scope :randomized,           lambda { order "random()" }

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

  def speaker?
    role? :speaker
  end

  def role?(base_role)
    ROLES.index(base_role.to_s) <= ROLES.index(role)
  end

  def full_name(separator = ', ')
    names = []
    names << self.last_name unless self.last_name.blank?
    names << self.first_name unless self.first_name.blank?
    names.compact.join(separator)
  end


  def displayable?
    # TODO: allow for displaying speakers profile when they have an accepted session
  end

  protected

  def seoize_permalink
    Formatter.seoize!(self.permalink)
  end

  def set_permalink
    self.permalink = full_name(' ')
  end
end


# == Schema Information
#
# Table name: users
#
#  id                   :integer         primary key
#  email                :string(255)     default(""), not null
#  encrypted_password   :string(255)     default("")
#  reset_password_token :string(255)
#  remember_token       :string(255)
#  remember_created_at  :timestamp
#  sign_in_count        :integer         default(0)
#  current_sign_in_at   :timestamp
#  last_sign_in_at      :timestamp
#  current_sign_in_ip   :string(255)
#  last_sign_in_ip      :string(255)
#  created_at           :timestamp
#  updated_at           :timestamp
#  role                 :string(255)     default("guest")
#  submissions_id       :integer
#  home_page            :string(255)
#  first_name           :string(255)
#  last_name            :string(255)
#  biography            :text
#  avatar_file_name     :string(255)
#  avatar_content_type  :string(255)
#  avatar_file_size     :integer
#  avatar_updated_at    :timestamp
#  confirmation_token   :string(255)
#  confirmed_at         :timestamp
#  confirmation_sent_at :timestamp
#  invitation_token     :string(20)
#  invitation_sent_at   :timestamp
#  speakerrate          :string(2048)
#  twitter              :string(32)
#

