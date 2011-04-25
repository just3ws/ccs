class TimeSlot < ActiveRecord::Base
  validates_presence_of :starts_at
  validates_presence_of :ends_at

  validate :that_start_is_before_end

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
#  start      :datetime
#  end        :datetime
#  title      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

