set :stages, %w(rmr-2012crew rmr-2013crew)
set :default_stage, "rmr-2013crew"

require 'capistrano/ext/multistage'

set :rvm_ruby_string, 'jruby'
set :rvm_type, :system
require 'rvm/capistrano'

set :application, "FestivalAdmin"

set :scm, :git
set :repository, "git@github.com:tg90nor/FestivalAdmin.git"
set :local_repository, "/home/tg90nor/proj/FestivalAdmin"
set :deploy_env, 'production'

set :normalize_asset_timestamps, false

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
after "deploy:update_code", "localconfig"

task :localconfig do
  run "ln -nfs #{deploy_to}/#{shared_dir}/config/database.yml #{release_path}/config/database.yml"
end
