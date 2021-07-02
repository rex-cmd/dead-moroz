CarrierWave.configure do |config|
  config.storage= :fog
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
     :provider               => 'AWS',
     :aws_access_key_id      => Rails.application.credentials.dig(:spaces, :access_key_id),
     :aws_secret_access_key  => Rails.application.credentials.dig(:spaces, :secret),
     :region                 => 'nyc3',
     :endpoint               => 'https://nyc3.digitaloceanspaces.com'
  }
  config.fog_directory  = 'dead-moroz2'
  # config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}
  # config.fog_public = false
  #  config.asset_host = "https://dead-moroz2.nyc3.digitaloceanspaces.com"
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}
  # config.asset_host = "https://nyc3.digitaloceanspaces.com"
  # config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}
  # config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" }
end