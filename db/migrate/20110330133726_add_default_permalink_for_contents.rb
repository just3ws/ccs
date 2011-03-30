class AddDefaultPermalinkForContents < ActiveRecord::Migration
  def self.up
    c = Content.find_or_create_by_permalink("default")
    c.title = "Default page content"
    c.body = "Please update the content for 'default'."
    c.save!
  end

  def self.down
  end
end
