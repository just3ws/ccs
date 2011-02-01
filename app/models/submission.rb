class Submission < ActiveRecord::Base
  belongs_to :user, :autosave => true
  default_scope :order => 'created_at DESC'
  scope :visible, :conditions => {:deleted_at => nil}
  scope :hidden, :conditions => "deleted_at IS NOT NULL" 

  validates :user, :presence => true
  validates :title, :presence => true, :length => {:within => 0..64}
  validates :abstract, :presence => true, :length => {:within => 0..1024}
end
