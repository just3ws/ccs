class Room < ActiveRecord::Base
  validates_uniqueness_of :title
end


# == Schema Information
#
# Table name: rooms
#
#  id          :integer         not null, primary key
#  title       :string(255)     indexed
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#
# Indexes
#
#  index_rooms_on_title  (title) UNIQUE
#

