# Log entries for production
if Rails.env.production?
  Rails.logger = Le.new(Settings['le']['token'])
end