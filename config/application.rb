require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RothStocks
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    #
    config.cache_store = :redis_store, 'redis:// <%= ENV["REDIS_URL"] %>: <%= ENV["REDIS_PORT"] %>/0/cache', { expires_in: 90.minutes }
    # config/application.rb
    ActiveRecord::Tasks::DatabaseTasks::LOCAL_HOSTS << "192.168.99.100" # <-- IP of your docker-host
  end
end
