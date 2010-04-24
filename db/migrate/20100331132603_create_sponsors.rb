class CreateSponsors < ActiveRecord::Migration
  def self.up
    create_table :sponsors do |t|
      t.string :name
      t.text :note, :allow_nil => true
      t.string :link, :allow_nil => true
      t.boolean :logo, :default => false
      t.string :level
      t.userstamps
      t.timestamps
    end
  end

  def self.down
    drop_table :sponsors
  end
end
