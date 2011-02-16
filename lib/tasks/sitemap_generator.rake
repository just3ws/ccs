desc "build and deploy sitemap"
task :generate_and_upload_sitemap => :environment do
  # builds the sitemap and deploys to S3 without notifying search engines
  Rake::Task["sitemap:refresh"].invoke

  AWS::S3::Base.establish_connection!(
          :access_key_id => S3Settings.access_key_id,
          :secret_access_key => S3Settings.secret_access_key
  )

  Dir.glob("tmp/*xml.gz").each do |f|
    filename = File.join(Rails.root, f)
    AWS::S3::S3Object.store(File.basename(filename), open(filename), S3Settings.bucket, :access => :public_read)
  end
end

