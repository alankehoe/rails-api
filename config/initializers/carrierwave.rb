CarrierWave.configure do |config|
  config.fog_credentials = {
      :provider => 'AWS', # required
      :aws_access_key_id => 'AKIAI4B5YXYDVG5YHLAA', # required
      :aws_secret_access_key => '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', # required
      :region => 'eu-west-1', # optional, defaults to 'us-east-1'
  }
  config.fog_directory = 'delta_base-production' # required
  config.fog_public = false # optional, defaults to true
  config.fog_attributes = {'Cache-Control' => 'max-age=1308172844'} # optional, defaults to {}
end