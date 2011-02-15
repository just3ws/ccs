class AddLevelToSubmission < ActiveRecord::Migration
  def self.up
    add_column :submissions, :level, :integer
  end

  def self.down
    remove_column :submissions, :level
  end
end
