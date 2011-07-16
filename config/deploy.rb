set :application, "FestivalAdmin"
set :domain, "rockmotrus.no"
set :subdomain, "crew"
set :repository,  "git@github.com:tg90nor/FestivalAdmin.git"

set :scm, :git

set :deploy_to, "/srv/#{domain}/#{subdomain}/#{application}"
set :use_sudo, false

role :web, "linted.net"
role :app, "linted.net"
role :db,  "linted.net", :primary => true

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

task :after_update_code do
run "ln -nfs #{deploy_to}/#{shared_dir}/config/database.yml #{release_path}/config/database.yml"
end
