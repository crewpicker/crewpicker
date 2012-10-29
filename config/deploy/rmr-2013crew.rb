set :domain, "rockmotrus.no"
set :subdomain, "2013crew"
set :deploy_to, "/srv/#{domain}/#{subdomain}/#{application}"

server '2013crew.rockmotrus.no', :app, :web, :db, :primary => true
