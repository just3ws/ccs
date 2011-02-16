desc "build and deploy sitemap"
task :upload_sitemap => :environment do
  # builds the sitemap and deploys to S3 without notifying search engines
  puts "generating sitemap"
  Rake::Task["sitemap:refresh"].invoke

  puts "establishing connection to s3"
  AWS::S3::Base.establish_connection!(
    :access_key_id     => S3Settings.access_key_id,
    :secret_access_key => S3Settings.secret_access_key
  )

  puts "uploading files..."
  puts "bucket: #{S3Settings.bucket}"
  Dir.glob("tmp/*xml.gz").each do |f|
    filename = File.join(Rails.root, f)
    AWS::S3::S3Object.store(File.basename(filename), open(filename), S3Settings.bucket, :access => :public_read)
    puts " uploaded '#{filename}' to S3 bucket '#{S3Settings.bucket}'."
  end
end

