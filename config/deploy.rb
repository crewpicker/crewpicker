set :stages, %w(rmr-2011crew rmr-2012crew)
set :default_stage, "rmr-2012crew"
require 'capistrano/ext/multistage'

server 'linted.net', :app, :web, :primary => true

set :application, "FestivalAdmin"

set :scm, :git
set :repository, "git@github.com:tg90nor/FestivalAdmin.git"
set :deploy_via, :remote_cache
set :deploy_env, 'production'

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
after "deploy:update_code", ":localconfig"

task :localconfig do
  run "ln -nfs #{deploy_to}/#{shared_dir}/config/database.yml #{release_path}/config/database.yml"
  run "ln -nfs #{deploy_to}/#{shared_dir}/config/unicorn.rb #{release_path}/config/unicorn.rb"
end
