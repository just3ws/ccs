class CreateFeatures < ActiveRecord::Migration
  def self.up
    create_table :features do |t|
      t.string :name, :limit => 32
      t.boolean :enabled, :default => false
      t.string :description, :limit => 1024

      t.timestamps
    end
    add_index :features, :name, :unique
  end

  def self.down
    remove_index :features, :column => :name
    drop_table :features
  end
end
