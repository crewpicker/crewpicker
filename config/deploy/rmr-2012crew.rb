set :domain, "rockmotrus.no"
set :subdomain, "2012crew"
set :deploy_to, "/srv/#{domain}/#{subdomain}/#{application}"

server '2012crew.rockmotrus.no', :app, :web, :db, :primary => true
