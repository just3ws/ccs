desc "This task is called by the Heroku cron add-on"
task :cron => :environment do
  if Time.now.hour % 4 == 0
    Rake::Task["generate_and_upload_sitemap"].invoke
  end
end

