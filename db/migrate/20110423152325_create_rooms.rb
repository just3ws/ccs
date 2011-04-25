class CreateRooms < ActiveRecord::Migration
  def self.up
    create_table :rooms do |t|
      t.string :title
      t.text :description

      t.timestamps
    end

    add_index :rooms, :title, :unique
  end

  def self.down
    remove_index :rooms, :column => :title

    drop_table :rooms
  end
end
