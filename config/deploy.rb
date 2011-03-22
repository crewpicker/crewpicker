set :application, "FestivalAdmin"
set :repository,  "git@github.com:tg90nor/FestivalAdmin.git"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :deploy_to, "/home/tg90nor/Linted/#{application}"
set :use_sudo, false

role :web, "linted.net"                          # Your HTTP server, Apache/etc
role :app, "linted.net"                          # This may be the same as your `Web` server
role :db,  "linted.net", :primary => true # This is where Rails migrations will run

after "deploy", "deploy:bundle_gems"
after "deploy:bundle_gems", "deploy:restart"

namespace :deploy do
  task :bundle_gems do
    run "cd #{deploy_to}/current && /var/lib/gems/1.8/bin/bundle install"
  end
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
