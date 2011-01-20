class CreatePreregistrations < ActiveRecord::Migration
  def self.up
    create_table :preregistrations do |t|
      t.string :email

      t.timestamps
    end
  end

  def self.down
    drop_table :preregistrations
  end
end
