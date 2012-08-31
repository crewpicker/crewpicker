source 'http://rubygems.org'

gem 'rails', '3.0.10'

gem 'capistrano'
gem 'capistrano-ext'

platforms :ruby do
  gem 'mysql'
end

platforms :jruby do
  gem 'jruby-openssl'
  gem 'activerecord-jdbcmysql-adapter'
end

group :test, :production do
  gem 'warbler'
end

group :development do
  gem 'trinidad'
end

gem 'paperclip', '~> 2.3'
gem 'uuidtools'
gem 'pdfkit', :git => "git://github.com/huerlisi/PDFKit.git"
gem 'sorcery', '0.7.5'
gem 'declarative_authorization'

group :production do
  gem 'wkhtmltopdf' if RUBY_PLATFORM.include?('linux') 
end

gem 'newrelic_rpm'
