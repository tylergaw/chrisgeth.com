class Video < ActiveRecord::Base
  # NOTE: For some reason the s3 config stuff HAS to be set here as well as in
  # the config. No idea why, it's stupid
  has_attached_file :image,
    :storage => :s3,
    :s3_credentials => {
      :bucket => ENV['S3_BUCKET'],
      :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
      :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
    }

  validates_attachment_content_type :image, :content_type =>
    ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
