class AddPermalinkToSesja < ActiveRecord::Migration
  def self.up
    add_column :sesjas, :permalink, :string
    add_index :sesjas, :permalink
    add_index :sesjas, :title 
    Sesja.all.each do |u|
      u.update_attribute(:permalink, u.title)
    end
  end

  def self.down
    remove_index :sesjas, :column => :title 
    remove_index :sesjas, :column => :permalink
    remove_column :sesjas, :permalink
  end
end
