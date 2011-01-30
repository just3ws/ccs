class AddStatusToPreregistrations < ActiveRecord::Migration
  def self.up
    add_column :preregistrations, :status, :string
  end

  def self.down
    remove_column :preregistrations, :status
  end
end
