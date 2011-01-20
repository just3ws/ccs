class Preregistration < ActiveRecord::Base
  validates :email, :presence => true
end
