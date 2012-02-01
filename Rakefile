# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
require 'rake'

#if %[development test].include? Rails.env
  #require 'metric_fu'
  #MetricFu::Configuration.run do |config|
    #config.metrics -= [:rcov]
    #config.darwin_txmt_protocol_no_thanks = true
    #config.verbose = true
  #end
#end

namespace :tmp do
  namespace :assets do
    desc "Clears javascripts/cache and stylesheets/cache"
    task :clear => :environment do
      FileUtils.rm(Dir['public/javascripts/cache/[^.]*'])
      FileUtils.rm(Dir['public/stylesheets/cache/[^.]*'])
    end
  end
end

Ccs::Application.load_tasks
