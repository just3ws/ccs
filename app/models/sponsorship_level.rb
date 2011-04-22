class SponsorshipLevel < ActiveRecord::Base
  has_many :sponsors
  default_scope :order => 'priority ASC'
end
