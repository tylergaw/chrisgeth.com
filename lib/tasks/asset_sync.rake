desc "Sync assets with s3"
task :asset_sync => :environment do
  puts "## Syncing assets..."

  # Weird variable to set, but it turns on AssetSync logging
  ENV['RAILS_GROUPS'] = "assets"

  # Do the work
  AssetSync.sync
end
