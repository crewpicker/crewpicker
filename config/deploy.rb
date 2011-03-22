set :application, "FestivalAdmin"
set :repository,  "git@github.com:tg90nor/FestivalAdmin.git"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :deploy_to, "/home/tg90nor/Linted/#{application}"
set :use_sudo, false

role :web, "linted.net"                          # Your HTTP server, Apache/etc
role :app, "linted.net"                          # This may be the same as your `Web` server
role :db,  "linted.net", :primary => true # This is where Rails migrations will run

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

namespace :bundler do
  task :install, :roles => :app do
    shared_dir = File.join(shared_path, 'bundle')
    run "cd #{release_path} && bundle install --path=#{shared_dir}"

    on_rollback do
      if previous_release
        run "cd #{previous_release} && bundle install --path=#{shared_dir}"
      else
        logger.important "no previous release to rollback to, rollback of bundler:install skipped"
      end
    end
  end

  task :bundle_new_release, :roles => :db do
    bundler.install
  end
end

after "deploy:rollback:revision", "bundler:install"
after "deploy:update_code", "bundler:bundle_new_release"
