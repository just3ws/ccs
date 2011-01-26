class AddSubmissionsToUser < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.references :submissions
    end
  end

  def self.down
    remove_column :users, :submissions
  end
end
