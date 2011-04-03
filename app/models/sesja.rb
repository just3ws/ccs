class Sesja < ActiveRecord::Base
  belongs_to :user, :autosave => true
  default_scope :order => 'created_at DESC'
  scope :displayable, :conditions => {:accepted => true, :rsvped => true}

  validates :user, :presence => true
  validates :title, :presence => true, :length => {:within => 0..64}
  validates :abstract, :presence => true, :length => {:within => 0..1024}
  validates_inclusion_of :level, :in => 0..3

  def accepted?
    !!self.accepted_at
  end

  def rsvped?
    !!self.rsvped_at
  end

  def mailed?
    !!self.mailed_at
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
#

