class AddSesjaIdToSubmission < ActiveRecord::Migration
  def self.up
    add_column :submissions, :sesja_id, :integer
  end

  def self.down
    remove_column :submissions, :sesja_id
  end
end
