set :user, "deploy"
set :domain, "ccs.just3ws.com"
set :application, "ccs"

set :repository, "git@github.com:just3ws/ccs.git"
set :scm, "git"
set :branch, "public"
set :scm_verbose, true
set :deploy_via, :remote_cache
set :scm_passphrase, "deployme"
set :deploy_to, "/home/#{user}/#{domain}"
set :use_sudo, false

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

role :web, domain
role :app, domain
role :db, domain, :primary => true


## If you are using Passenger mod_rails uncomment this:
namespace :deploy do
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end
end
