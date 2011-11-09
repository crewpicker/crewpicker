set :domain, "rockmotrus.no"
set :subdomain, "2012crew"
set :deploy_to, "/srv/#{domain}/#{subdomain}/#{application}"

server '2012crew.rockmotrus.no', :app, :web, :db, :primary => true

after "deploy:update_code", "dblink"

task :dblink do
  run "ln -nfs #{deploy_to}/#{shared_dir}/db/db_production #{release_path}/db/db_production"
end
