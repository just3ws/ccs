class Schedule < ActiveRecord::Base
  belongs_to :sesja
  belongs_to :room
  belongs_to :time_slot
end

# == Schema Information
#
# Table name: schedules
#
#  id           :integer         not null, primary key
#  sesja_id     :integer
#  room_id      :integer
#  time_slot_id :integer
#  created_at   :datetime
#  updated_at   :datetime
#

