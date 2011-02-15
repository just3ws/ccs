class AddKeywordsToSubmission < ActiveRecord::Migration
  def self.up
    add_column :submissions, :keywords, :string
  end

  def self.down
    remove_column :submissions, :keywords
  end
end
