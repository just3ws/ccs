class AddPriorityColumnToSponsorshipLevels < ActiveRecord::Migration
  def self.up
    add_column :sponsorship_levels, :priority, :integer
  end

  def self.down
    remove_column :sponsorship_levels, :priority
  end
end
