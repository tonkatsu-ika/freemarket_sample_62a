require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  config.storage = :fog
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider: 'AWS',
    #aws_access_key_id: Rails.application.secrets.aws_access_key_id,
    #aws_secret_access_key: Rails.application.secrets.aws_secret_access_key,
    aws_access_key_id: ENV["AWS_ACCESS_KEY_ID"],
    aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
    region: 'ap-northeast-1'
  }

  config.fog_directory  = 'freemarket-t62a'
  config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/freemarket-t62a'
end
