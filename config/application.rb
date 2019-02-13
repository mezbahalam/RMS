require_relative 'boot'
require 'rails/all'
require 'active_storage/engine'
Bundler.require(*Rails.groups)

module RMS
  class Application < Rails::Application
    config.beginning_of_week = :sunday
    config.i18n.available_locales = [:en, :ru]
    config.i18n.default_locale = :en
    config.load_defaults 5.2
    config.generators do|g|
       g.test_framework :rspec,
                        fixtures: true,
                        view_specs: false,
                        helper_specs: false,
                        routing_specs: false,
                        controller_specs: true,
                        request_specs: false
       g.fixture_replacement :factory_bot, dir: "spec/factories"
     end
  end
end
