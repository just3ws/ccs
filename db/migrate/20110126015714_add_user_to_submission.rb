class AddUserToSubmission < ActiveRecord::Migration
  def self.up
    change_table :submissions do |t|
      t.references :user
    end
  end

  def self.down
    remove_column :submissions, :user
  end
end
