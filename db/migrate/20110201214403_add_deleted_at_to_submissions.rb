class AddDeletedAtToSubmissions < ActiveRecord::Migration
  def self.up
    add_column :submissions, :deleted_at, :timestamp, :default => nil
  end

  def self.down
    remove_column :submissions, :deleted_at
  end
end
