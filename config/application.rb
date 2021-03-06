require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Mayo
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.i18n.default_locale = :en
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local
    # config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '*.{rb,yml}')]

    config.generators do |g|
      g.assets false
      g.helper false
      g.jbuilder false
    end

    config.generators do |g|
      g.test_framework :rspec,
        model_specs: true,
        view_specs: false,
　　　　　helper_specs: false,
        routing_specs: false,
        controller_specs: false,
        request_specs: false
    end
  end
end
