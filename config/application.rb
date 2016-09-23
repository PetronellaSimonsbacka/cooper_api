require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
# require "sprockets/railtie"
# require "rails/test_unit/railtie"


Bundler.require(*Rails.groups)

module CooperApi
  class Application < Rails::Application

    config.api_only = true
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*',
          headers: :any,
          expose: %w(access-token expiry token-type uid client),
          methods: [:get, :post, :put, :delete],
          max_age: 0
      end
    end
  end
end
