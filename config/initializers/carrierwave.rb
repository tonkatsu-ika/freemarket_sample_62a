require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|

  if Rails.env.production?

  else
    config.storage :file
    config.enable_processing = false if Rails.env.test?
  end

end
