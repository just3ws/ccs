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
#
# Table name: time_slots
#
#  id          :integer         not null, primary key
#  starts_at   :datetime
#  ends_at     :datetime
#  title       :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  version_tag :string(255)
#

