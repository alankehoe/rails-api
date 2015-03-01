Sidekiq.configure_server do |config|
  config.redis = {url: Settings['sidekiq']['redis']}
end

Sidekiq.configure_client do |config|
  config.redis = {url: Settings['sidekiq']['redis']}
end

# Sidekiq.configure_client do |config|
#   config.redis = {
#       master_name: 'master01',
#       sentinels: %w(
#         sentinel://192.168.100.113:26379
#         sentinel://192.168.100.114:26379
#         sentinel://192.168.100.115:26379
#       ),
#       failover_reconnect_timeout: 20
#   }
# end
#
# Sidekiq.configure_server do |config|
#   config.redis = {
#       master_name: 'master01',
#       sentinels: %w(
#         sentinel://192.168.100.113:26379
#         sentinel://192.168.100.114:26379
#         sentinel://192.168.100.115:26379
#       ),
#       failover_reconnect_timeout: 20
#   }
# end