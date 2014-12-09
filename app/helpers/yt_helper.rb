module YtHelper
  def yt_client
    yt_client = YouTubeIt::Client.new :dev_key => ENV['YOUTUBE_KEY']
  end

  def get_video_by_url(url)
    video = yt_client.video_by url
  end

  def get_video_img_by_id(video_id, thumb_name = 'sddefault')
    return "http://i.ytimg.com/vi/#{video_id}/#{thumb_name}.jpg"
  end

  def get_video_thumb_by_name(video, thumb_name = 'sddefault')
    thumbs = video.thumbnails
    img = thumbs[thumbs.find_index{|a| a.name == thumb_name}]
    return img
  end
end
