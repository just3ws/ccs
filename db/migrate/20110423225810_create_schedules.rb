class CreateSchedules < ActiveRecord::Migration
  def self.up
    create_table :schedules do |t|
      t.references :sesja
      t.references :room
      t.references :time_slot

      t.timestamps
    end
  end

  def self.down
    drop_table :schedules
  end
end
