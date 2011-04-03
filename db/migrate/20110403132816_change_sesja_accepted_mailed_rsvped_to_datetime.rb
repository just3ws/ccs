class ChangeSesjaAcceptedMailedRsvpedToDatetime < ActiveRecord::Migration
  def self.up
    add_column :sesjas, :accepted_at, :datetime
    add_column :sesjas, :mailed_at, :datetime
    add_column :sesjas, :rsvped_at, :datetime

    remove_column :sesjas, :accepted
    remove_column :sesjas, :mailed
    remove_column :sesjas, :rsvped
  end

  def self.down
    add_column :sesjas, :rsvped
    add_column :sesjas, :mailed
    add_column :sesjas, :accepted

    remove_column :sesjas, :rsvped_at
    remove_column :sesjas, :mailed_at
    remove_column :sesjas, :accepted_at
  end
end
