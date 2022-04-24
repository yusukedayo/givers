require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Givers
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    config.generators do |g|
      g.assets false
			# assetsファイルを作成する機能をfalse
      g.test_framework false
			# test_frameworkファイルを作成する機能をfalse
      g.helper false
			# helperファイルを作成する機能をfalse
      g.skip_routes true
      #routesの自動生成をスキップ
    end
  end
end
