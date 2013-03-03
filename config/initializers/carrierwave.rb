
CarrierWave.configure do |config|
  config.root = Rails.root.join('tmp') # adding these...
  config.cache_dir = 'carrierwave' # ...two lines

  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => 'AKIAIWBD37GIQMJC7WKQ',                        # required
    :aws_secret_access_key  => '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',                     # required

  }
  config.fog_directory  = 'amazonBucket'                             # required
  config.fog_public     = false                                   # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end

