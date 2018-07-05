config_hash = { url: 'redis://redis:6379' }

Sidekiq.configure_server { |config| config.redis = config_hash }
Sidekiq.configure_client { |config| config.redis = config_hash }
