require_relative 'boot'
require 'rails/all'
require 'active_storage/engine'
Bundler.require(*Rails.groups)

module RMS
  class Application < Rails::Application
    config.i18n.available_locales = [:en, :ru]
    config.i18n.default_locale = :en
    config.load_defaults 5.2
  end
end
