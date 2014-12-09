module TumblrHelper
  BlogURL = 'thechrisgethardshow.tumblr.com'
  WhitelistTag = 'chrisgeth'

  def tb_client
    tb_client = Tumblr::Client.new :consumer_key => ENV['TUMBLR_KEY']
  end

  def get_post_by_id(id)
    res = tb_client.posts('thechrisgethardshow.tumblr.com', :id => id)
    res["posts"][0]
  end
end
