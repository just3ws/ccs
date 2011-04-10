class AddPermalinkToUser < ActiveRecord::Migration

  # rename migration to AddPermalinkToUser
  # duplicate migration for AddPermalinkToSesja

  # script to set the permalink from firstname - last name for users
  # script to set the permalink to title for sesja


  def self.up
    add_column :users, :permalink, :string
    add_index :users, :permalink
    add_index :users, [:first_name, :last_name]
    User.all.each do |u|
      u.update_attribute(:permalink, u.full_name)
    end
  end

  def self.down
    remove_index :users, :column => [:first_name, :last_name]
    remove_index :users, :column => :permalink
    remove_column :users, :permalink
  end
end
