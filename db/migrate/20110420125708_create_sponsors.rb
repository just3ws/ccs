class CreateSponsors < ActiveRecord::Migration
  def self.up
    create_table :sponsors do |t|
      t.string :name
      t.string :contact_name
      t.text :description
      t.string :home_page
      t.references :sponsorship_level
      t.string :email

      t.timestamps
    end
  end

  def self.down
    drop_table :sponsors
  end
end
