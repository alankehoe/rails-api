Sidekiq.configure_server do |config|
  config.redis = {url: Settings['sidekiq']['redis']}
end

Sidekiq.configure_client do |config|
  config.redis = {url: Settings['sidekiq']['redis']}
end