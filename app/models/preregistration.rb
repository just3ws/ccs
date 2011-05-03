class Preregistration < ActiveRecord::Base
  # The idea for status is that we may need to email
  # the people that gave their email addresses in batches,
  # avoiding that we get flagged as a spam source.
  # We can also block any bogus entries.
  STATUSES = %w(NEW CONTACTED BLOCKED)

  validates :email, :presence => true
  validates_uniqueness_of :email, :message => 'has already been registered for updates'
  validates :status, :inclusion => {:in => STATUSES}
end



# == Schema Information
#
# Table name: preregistrations
#
#  id         :integer         not null, primary key
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#  status     :string(255)
#

