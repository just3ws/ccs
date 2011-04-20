class Sponsor < ActiveRecord::Base
  has_one :sponsorship_level
end
