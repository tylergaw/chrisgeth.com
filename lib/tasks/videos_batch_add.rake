require "#{Rails.root}/app/helpers/yt_helper"
require "json"
include YtHelper

namespace :videos do
  desc "Create Videos from JSON input"
  task :batch_add, [:input] => :environment do |t, args|
    json_text = File.read(args.input)
    data = JSON.parse(json_text)

    data['videos'].each do |video|
      v = Video.new
      v.title = video['title']
      v.url = video['url']
      v.description = video['description']

      if video['url'].include? "youtube"
        yt_video = get_video_by_url video['url']
        img = get_video_thumb_by_name yt_video
        v.image = open(img.url)
      end

      if video['image_url']
        v.image = open(video['image_url'])
      end

      v.save
    end
  end
end
