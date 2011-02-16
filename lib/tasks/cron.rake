desc "This task is called by the Heroku cron add-on"
task :cron => :environment do
  Rake::Task["generate_and_upload_sitemap"].invoke
end

