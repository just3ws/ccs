class Schedule < ActiveRecord::Base
  belongs_to :sesja
  belongs_to :room
  belongs_to :time_slot

  default_scope joins(:time_slot).order("time_slots.starts_at ASC")

  scope :with_sessions, includes(:sesja).joins(:sesja).where("schedules.sesja_id is not null")
  scope :with_rooms, includes(:room).joins(:room).where("schedules.room_id is not null")
  scope :with_time_slots, includes(:time_slot).joins(:time_slot).where("schedules.time_slot_id is not null")

  class << self
    def assigned
      Schedule.with_sessions.with_rooms.with_time_slots
    end
  end

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

