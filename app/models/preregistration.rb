class Preregistration < ActiveRecord::Base
  validates :email, :presence => true
  validates_uniqueness_of :email, :message => 'has already been registered for updates'
  # The idea for status is that we may need to email
  # the people that gave their email addresses in batches,
  # avoiding that we get flagged as a spam source.
  # We can also block any bogus entries.
  validates :status,  :inclusion => {:in => %w(NEW CONTACTED BLOCKED)}
end
