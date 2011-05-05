class Room < ActiveRecord::Base
  has_many :schedules

  validates_uniqueness_of :title

  def to_s
    title
  end
end



# == Schema Information
#
# Table name: rooms
#
#  id          :integer         primary key
#  title       :string(255)     indexed
#  description :text
#  created_at  :timestamp
#  updated_at  :timestamp
#
# Indexes
#
#  index_rooms_on_title  (title) UNIQUE
#

