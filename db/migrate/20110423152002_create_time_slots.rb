class CreateTimeSlots < ActiveRecord::Migration
  def self.up
    create_table :time_slots do |t|
      t.datetime :starts_at
      t.datetime :ends_at
      t.string :title

      t.timestamps
    end

    add_index :time_slots, [:starts_at, :ends_at], :unique
    add_index :time_slots, :title, :unique
  end

  def self.down
    remove_index :time_slots, :column => :title
    remove_index :time_slots, :column => [:start, :end]

    drop_table :time_slots
  end
end
