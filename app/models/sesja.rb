class Sesja < ActiveRecord::Base
  belongs_to :user, :autosave => true
  has_one :schedule

  default_scope where("sesjas.version_tag = ?", VERSION_TAG).order('sesjas.permalink ASC')

  scope :by_creation, :order => 'sesjas.created_at DESC'

  scope :pending_confirmation, lambda { where( "sesjas.accepted_at is null" ) }
  scope :displayable,          lambda { includes(:user).where( "sesjas.rsvped_at is not null" ) }
  scope :randomized,           lambda { order "random()" }

  validates :user, :presence => true
  validates :title, :presence => true, :length => {:within => 0..64}
  validates :abstract, :presence => true, :length => {:within => 0..1024}
  validates_inclusion_of :level, :in => 0..3

  before_save :set_permalink, :seoize_permalink

  has_many :comments, :as => :commentable

  def accepted?
    !!self.accepted_at
  end

  def rsvped?
    !!self.rsvped_at
  end

  def mailed?
    !!self.mailed_at
  end

  def to_s
    permalink
  end

  protected

  def seoize_permalink
    Formatter.seoize!(self.permalink)
  end

  def set_permalink
    # assigning the string actually is a ref
    # so dup is necesary. :P
    self.permalink = self.title.dup
  end
end






# == Schema Information
#
# Table name: sesjas
#
#  id          :integer         not null, primary key
#  title       :string(255)
#  abstract    :text
#  level       :integer
#  keywords    :string(255)
#  user_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#  accepted_at :datetime
#  mailed_at   :datetime
#  rsvped_at   :datetime
#  permalink   :string(255)
#  version_tag :string(255)
#

