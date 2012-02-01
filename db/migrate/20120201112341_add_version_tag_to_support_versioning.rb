class AddVersionTagToSupportVersioning < ActiveRecord::Migration
  def self.up
    add_column :rooms, :version_tag, :string
    add_column :schedules, :version_tag, :string
    add_column :sesjas, :version_tag, :string
    add_column :sponsors, :version_tag, :string
    add_column :submissions, :version_tag, :string
    add_column :time_slots, :version_tag, :string
  end

  def self.down
    remove_column :time_slots, :version_tag
    remove_column :submissions, :version_tag
    remove_column :sponsors, :version_tag
    remove_column :sesjas, :version_tag
    remove_column :schedules, :version_tag
    remove_column :rooms, :version_tag
  end
end
