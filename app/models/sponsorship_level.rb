class SponsorshipLevel < ActiveRecord::Base
  has_many :sponsors
  default_scope :order => 'priority ASC'
end

# == Schema Information
#
# Table name: sponsorship_levels
#
#  id          :integer         primary key
#  name        :string(255)
#  description :text
#  created_at  :timestamp
#  updated_at  :timestamp
#  priority    :integer
#
