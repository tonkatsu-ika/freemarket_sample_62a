require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|

  if Rails.env.production?
    config.storage :fog
    config.fog_provider = 'fog/aws'
    config_fog_directory = 'freemarket-t62a'
    config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/freemarket-t62a'

    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: Rails.application.credentials.aws[:AWS_ACCESS_KEY_ID],
      aws_secret_access_key: Rails.application.credentials.aws[:AWS_SECRET_ACCESS_KEY],
      use_iam_profile: true,
      region: 'ap-northeast-1'
    }

  else
    config.storage :file
    config.enable_processing = false if Rails.env.test?
  end

end
