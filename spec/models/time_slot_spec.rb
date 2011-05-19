require 'spec_helper'

describe TimeSlot do
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

