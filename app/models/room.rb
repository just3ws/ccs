class Room < ActiveRecord::Base
  has_many :schedules

  default_scope where("rooms.version_tag = ?", VERSION_TAG).order("rooms.title ASC")

  validates_uniqueness_of :title

  def to_s
    title
  end
end



# == Schema Information
#
# Table name: rooms
#
#  id          :integer         not null, primary key
#  title       :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#  version_tag :string(255)
#

