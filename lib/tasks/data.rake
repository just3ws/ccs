namespace :data do
  desc "Load the submissions into sesja (sessions)"
  task :load_submissions_into_sesja => :environment do
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

  namespace :one_off do
    task :set_version_tag => :environment do
      version_tag = "2011-05"
      Room.update_all(:version_tag => version_tag)
      Schedule.update_all(:version_tag => version_tag)
      Sesja.update_all(:version_tag => version_tag)
      Sponsor.update_all(:version_tag => version_tag)
      Submission.update_all(:version_tag => version_tag)
      TimeSlot.update_all(:version_tag => version_tag)
    end
  end
end
