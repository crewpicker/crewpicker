set :stages, %w(rmr-2012crew rmr-2013crew)
set :default_stage, "rmr-2013crew"

require 'capistrano/ext/multistage'

set :rvm_ruby_string, 'jruby-1.7.3'
set :rvm_type, :system
require 'rvm/capistrano'
require "bundler/capistrano"

set :application, "FestivalAdmin"

set :scm, :git
set :repository, "git@github.com:tg90nor/FestivalAdmin.git"
set :local_repository, "~/proj/FestivalAdmin"
set :deploy_env, 'production'

set :normalize_asset_timestamps, false

namespace :deploy do
  desc "Tell Passenger to restart."
  task :restart, :roles => :web do
    run "touch #{deploy_to}/current/tmp/restart.txt"
  end

  desc "Symlink config files"
  task :symlink_config do
    run "ln -nfs #{deploy_to}/#{shared_dir}/config/database.yml #{release_path}/config/database.yml"
    run "ln -nfs #{deploy_to}/#{shared_dir}/config/config.yml #{release_path}/config/config.yml"
  end
end

after "deploy:update_code", "deploy:symlink_config"
