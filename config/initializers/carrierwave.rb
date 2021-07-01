CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
     :provider               => 'AWS',
     :aws_access_key_id      => Rails.application.credentials.dig(:aws, :access_key_id),
     :aws_secret_access_key  => Rails.application.credentials.dig(:aws, :secret_key_id),
     :region                 => 'us-east-1',
     :endpoint               => 'https://fra1.digitaloceanspaces.com'
  }
  config.fog_directory  = 'https://fra1.digitaloceanspaces.com'
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}
  config.fog_public = false
  config.asset_host = "https://fra1.digitaloceanspaces.com"
  config.fog_attributes = { 'Cache-Control' => 'max-age=31557s6000' }
end