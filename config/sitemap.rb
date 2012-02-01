## Set the host name for URL creation
#SitemapGenerator::Sitemap.default_host = ENV['SITEMAP_DEFAULT_HOST']

## Set the following to true if you do not want the / added to your sitemap automatically
##SitemapGenerator::Sitemap.exclude_root = false

## S3 setup
#SitemapGenerator::Sitemap.sitemaps_host = "https://s3.amazonaws.com"
#SitemapGenerator::Sitemap.public_path = "tmp/"
## Inelegant S3 config
#SitemapGenerator::Sitemap.s3_access_key_id     = S3Settings.access_key_id
#SitemapGenerator::Sitemap.s3_secret_access_key = S3Settings.secret_access_key
#SitemapGenerator::Sitemap.s3_bucket_name       = S3Settings.bucket

#SitemapGenerator::Sitemap.add_links do |sitemap|
  ## Put links creation logic here.
  ##
  ## The root path '/' and sitemap index file are added automatically.
  ## Links are added to the Sitemap in the order they are specified.
  ##
  ## Usage: sitemap.add(path, options={})
  ##        (default options are used if you don't specify)
  ##
  ## Defaults: :priority => 0.5, :changefreq => 'weekly',
  ##           :lastmod => Time.now, :host => default_host
  ##
  ##
  ## Examples:
  ##
  ## Add '/articles'
  ##
  ##   sitemap.add articles_path, :priority => 0.7, :changefreq => 'daily'
  ##
  ## Add individual articles:
  ##
  ##   Article.find_each do |article|
  ##     sitemap.add article_path(article), :lastmod => article.updated_at
  ##   end
#end

