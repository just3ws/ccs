class CreateSponsorshipLevels < ActiveRecord::Migration
  def self.up
    create_table :sponsorship_levels do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :sponsorship_levels
  end
end
