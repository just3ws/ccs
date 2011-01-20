class CreateSubmissions < ActiveRecord::Migration
  def self.up
    create_table :submissions do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.text :biography
      t.string :title
      t.text :abstract
      t.string :home_page

      t.string :avatar_file_name
      t.string :avatar_content_type
      t.integer :avatar_file_size
      t.datetime :avatar_updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :submissions
  end
end
