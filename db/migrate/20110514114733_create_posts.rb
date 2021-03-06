class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.string :title
      t.text :text
      t.string :permalink

      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
