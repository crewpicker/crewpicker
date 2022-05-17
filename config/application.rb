require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module FestivalAdmin
  class Application < Rails::Application
    config.load_defaults 7.0
    config.time_zone = 'UTC'
    config.i18n.enforce_available_locales = true
    config.i18n.default_locale = :en
    config.encoding = "utf-8"
    config.middleware.use PDFKit::Middleware
    config.generators do |g|
      g.test_framework :rspec,
        fixtures: true,
        view_specs: false,
        helper_specs: false,
        routing_specs: false,
        controller_specs: true,
        request_specs: false
      g.fixture_replacement :factory_girl, dir: "spec/factories"
    end
  end
end
