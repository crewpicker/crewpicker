source 'https://rubygems.org'
ruby '3.1.2'

gem 'rails', '7.0.3'
gem 'railties', '7.0.3'

# Rails defaults
gem 'puma', '~> 5.0'
gem 'importmap-rails', '~> 1.0.3'
gem 'jsbundling-rails', '~> 1.0.2'
gem 'dartsass-rails', '~> 0.3.0'
gem 'propshaft', '~> 0.6.4'
gem 'turbo-rails', '~> 1.0.1' # Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem 'stimulus-rails', '~> 1.0.4' # Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem 'jbuilder', '~> 2.11.5'
gem 'bootsnap', '>= 1.11.0', require: false # Reduces boot times through caching; required in config/boot.rb
gem 'tzinfo-data', platforms: %i[ mingw mswin x64_mingw jruby ] # Windows does not include zoneinfo files, so bundle the tzinfo-data gem
group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end
group :development do
  gem 'web-console'
  gem 'rack-mini-profiler'
end
group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

# crewpicker
gem 'paperclip', '~> 6.1.0'
gem 'pdfkit'
gem 'sorcery'
gem 'oauth2'
gem 'ae_declarative_authorization', '~> 1.0.0', require: 'declarative_authorization'
gem 'http_accept_language', '~> 2.1.1'
gem 'haml-rails', '~> 2.0.1' # haml parser
gem 'redcarpet', '~> 3.5.1' # markdown parser
gem 'jquery-rails'
gem 'momentjs-rails', '~> 2.29.1'
gem 'fullcalendar-rails', '~> 3.9.0'
gem 'chart-js-rails'
gem 'holder_rails', '~> 2.9.3' # Provides Holder.js to render image placeholders entirely on the client side
group :test, :development do
  gem 'rspec-rails'
  gem 'sqlite3', '~> 1.4.0'
end
group :development do
  gem 'solargraph'
end
group :production do
  gem 'mysql2', '~> 0.5.0'
end
