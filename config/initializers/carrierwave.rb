CarrierWave.configure do |config|
  config.storage = :fog
  config.fog_credentials = {
     :provider               => 'AWS',
     :access_key_id          => Rails.application.credentials.dig(:spaces, :access_key_id),
     :secret_access_key      => Rails.application.credentials.dig(:spaces, :secret_access_key),
     :region                 => 'fra1',
     :endpoint               => 'fra1.digitaloceanspaces.com'
  }
  config.fog_directory  = Rails.application.credentials.dig(:spaces, :bucket)
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}
  config.fog_public = false
  
end