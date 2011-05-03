require 'spec_helper'

describe TimeSlot do
  pending "add some examples to (or delete) #{__FILE__}"
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

