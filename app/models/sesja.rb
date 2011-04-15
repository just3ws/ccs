class Sesja < ActiveRecord::Base
  belongs_to :user, :autosave => true
  scope :by_creation, :order => 'created_at DESC'

  scope :pending_confirmation, lambda { where "accepted_at is null" }
  scope :displayable,          lambda { where "rsvped_at is not null" }
  scope :randomized,           lambda { order "random()" }

  validates :user, :presence => true
  validates :title, :presence => true, :length => {:within => 0..64}
  validates :abstract, :presence => true, :length => {:within => 0..1024}
  validates_inclusion_of :level, :in => 0..3
  before_save :seoize_permalink

  def accepted?
    !!self.accepted_at
  end

  def rsvped?
    !!self.rsvped_at
  end

  def mailed?
    !!self.mailed_at
  end

  protected

  def seoize_permalink
    Formatter.seoize!(self.permalink)
  end
end




# == Schema Information
# Schema version: 20110412232659
#
# Table name: sesjas
#
#  id          :integer         primary key
#  title       :string(255)
#  abstract    :text
#  level       :integer
#  keywords    :string(255)
#  user_id     :integer
#  created_at  :timestamp
#  updated_at  :timestamp
#  accepted_at :timestamp
#  mailed_at   :timestamp
#  rsvped_at   :timestamp
#  permalink   :string(255)
#
# Indexes
#
#  index_sesjas_on_title      (title)
#  index_sesjas_on_permalink  (permalink)
#

