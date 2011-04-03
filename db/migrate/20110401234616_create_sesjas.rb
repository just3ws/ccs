class CreateSesjas < ActiveRecord::Migration
  def self.up
    create_table :sesjas do |t|
      t.string :title, :limit => 255
      t.text :abstract
      t.integer :level
      t.string :keywords, :limit => 255
      t.boolean :accepted, :default => false
      t.boolean :mailed, :default => false
      t.boolean :rsvped, :default => false
      t.references :user

      t.timestamps
    end


    submissions = Submission.visible.select([:title, :abstract, :level, :keywords, :user_id])
    puts "converting #{submissions.count} submission(s)" 
    submissions.find_each do |s|
      begin
        if s.user
          puts "loading #{s.title}"
          sesja = Sesja.find_or_initialize_by_title(s.title)
          sesja.update_attributes(s.attributes.to_hash)
          sesja.save!
        end
      rescue Exception => e
        puts "unable to save #{e.inspect}"
      end
    end
  end

  def self.down
    drop_table :sesjas
  end
end
