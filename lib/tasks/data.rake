namespace :data do
  desc "Load the submissions into sesja (sessions)"
  task :load_submissions_into_sesja do
    submissions = Submission.visible.select([:title, :abstract, :level, :keywords, :user_id])
    puts "converting #{submissions.count} submission(s)" 
    submissions.find_each do |s|
      begin
        if s.user
          s[:level] ||= 0
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
end
