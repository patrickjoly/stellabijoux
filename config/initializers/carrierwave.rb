CarrierWave.configure do |config|
  config.root = Rails.root.join('tmp') # adding these...
  config.cache_dir = 'carrierwave' # ...two lines

  config.fog_credentials = {
    :provider               => 'xx',                        # required
    :aws_access_key_id      => 'xx',                        # required
    :aws_secret_access_key  => 'xx',                     # required

  }
  config.fog_directory  = 'amazonBucket'                             # required
  config.fog_public     = false                                   # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end

