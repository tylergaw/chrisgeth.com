AssetSync.configure do |config|
  config.gzip_compression = true
  config.existing_remote_files = 'keep'
  config.fog_provider = 'AWS'
  config.fog_directory = ENV['S3_BUCKET']
  config.aws_access_key_id = ENV['AWS_ACCESS_KEY_ID']
  config.aws_secret_access_key = ENV['AWS_SECRET_ACCESS_KEY']
  config.prefix = 'public'
  config.public_path = Pathname('./')
end
