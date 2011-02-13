class AddSpeakerrateToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :speakerrate, :string, :limit => 2048
  end

  def self.down
    remove_column :users, :speakerrate
  end
end
