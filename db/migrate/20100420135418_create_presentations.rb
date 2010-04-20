class CreatePresentations < ActiveRecord::Migration
  def self.up
    create_table :presentations do |t|

      t.string :title

      t.text :description

      t.string :speaker

      t.time :start

      t.time :end


      t.timestamps

    end
  end

  def self.down
    drop_table :presentations
  end
end
