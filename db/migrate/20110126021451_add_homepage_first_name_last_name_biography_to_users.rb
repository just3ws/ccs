class AddHomepageFirstNameLastNameBiographyToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :home_page, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :biography, :text
  end

  def self.down
    remove_column :users, :biography
    remove_column :users, :last_name
    remove_column :users, :first_name
    remove_column :users, :home_page
  end
end
