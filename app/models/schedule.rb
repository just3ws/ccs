class Schedule < ActiveRecord::Base
  belongs_to :sesja
  belongs_to :room
  belongs_to :time_slot

  default_scope includes(:time_slot).where('schedules.version_tag = ?', VERSION_TAG).order('time_slots.starts_at ASC')

  scope :with_sessions, includes(:sesja).where('schedules.sesja_id is not null')
  scope :with_rooms, includes(:room).where('schedules.room_id is not null')
  scope :with_time_slots, includes(:time_slot).where('schedules.time_slot_id is not null')

  class << self
    def assigned
      Schedule.with_rooms.with_time_slots
    end

    def last_updated_at
      sql = <<-SQL
select max(updated_at) as last_updated_at
from (
  select max(updated_at) as updated_at from schedules
  union
  select max(updated_at) as updated_at from time_slots
  union
  select max(updated_at) as updated_at from sesjas
  union
  select max(updated_at) as updated_at from rooms
) as updates;
      SQL
      DateTime.parse(ActiveRecord::Base.connection.execute(sql).first["last_updated_at"])

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
#  version_tag  :string(255)
#
