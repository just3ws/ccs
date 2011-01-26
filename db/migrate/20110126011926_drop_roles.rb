class DropRoles < ActiveRecord::Migration
  def self.up
    drop_table :roles
  rescue 
    puts "Didn't need to drop 'roles' after all."
  end     

  def self.down
    create_table :roles do |t|
      t.string :title
      t.references :user

      t.timestamps
    end
  end
end
