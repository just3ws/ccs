class TimeSlot < ActiveRecord::Base
  validates_presence_of :starts_at
  validates_presence_of :ends_at

  validate :that_start_is_before_end

  def start_and_end_time(separator = '-')
    "#{I18n.l starts_at} #{separator} #{I18n.l ends_at}".squish!
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
#  id         :integer         not null, primary key
#  starts_at  :datetime        indexed => [ends_at]
#  ends_at    :datetime        indexed => [starts_at]
#  title      :string(255)     indexed
#  created_at :datetime
#  updated_at :datetime
#
# Indexes
#
#  index_time_slots_on_title                  (title) UNIQUE
#  index_time_slots_on_starts_at_and_ends_at  (starts_at,ends_at) UNIQUE
#

