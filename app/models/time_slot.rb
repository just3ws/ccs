class TimeSlot < ActiveRecord::Base
  has_many :schedules

  validates_presence_of :starts_at
  validates_presence_of :ends_at

  validate :that_start_is_before_end

  default_scope where('time_slots.version_tag = ?', VERSION_TAG).order('starts_at ASC')

  def start_and_end_time(separator = '-')
    "#{starts_at.strftime('%l:%M')} #{separator} #{ends_at.strftime('%l:%M')}".squish!
  end

  def to_s
    start_and_end_time
  end

  protected

  def that_start_is_before_end
    ends_at >= starts_at
  end
end





# == Schema Information
# Schema version: 20110514114733
#
# Table name: time_slots
#
#  id         :integer         primary key
#  starts_at  :timestamp       indexed => [ends_at]
#  ends_at    :timestamp       indexed => [starts_at]
#  title      :string(255)     indexed
#  created_at :timestamp
#  updated_at :timestamp
#
# Indexes
#
#  index_time_slots_on_title                  (title) UNIQUE
#  index_time_slots_on_starts_at_and_ends_at  (starts_at,ends_at) UNIQUE
#

