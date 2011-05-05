class Schedule < ActiveRecord::Base
  belongs_to :sesja
  belongs_to :room
  belongs_to :time_slot

  default_scope includes(:time_slot).order("time_slots.starts_at ASC")

  scope :with_sessions, includes(:sesja).where("schedules.sesja_id is not null")
  scope :with_rooms, includes(:room).where("schedules.room_id is not null")
  scope :with_time_slots, includes(:time_slot).where("schedules.time_slot_id is not null")

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
#  id           :integer         primary key
#  sesja_id     :integer
#  room_id      :integer
#  time_slot_id :integer
#  created_at   :timestamp
#  updated_at   :timestamp
#

