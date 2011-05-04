class SponsorshipLevel < ActiveRecord::Base
  has_many :sponsors
  default_scope :order => 'sponsorship_levels.priority ASC'
end


# == Schema Information
#
# Table name: sponsorship_levels
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#  priority    :integer
#

