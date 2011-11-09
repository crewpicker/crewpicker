set :domain, "rockmotrus.no"
set :subdomain, "2011crew"
set :deploy_to, "/srv/#{domain}/#{subdomain}/#{application}"

server '2011crew.rockmotrus.no', :app, :web, :db, :primary => true
