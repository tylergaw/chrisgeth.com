module TumblrHelper
  def tb_client
    tb_client = Tumblr::Client.new :consumer_key => ENV['TUMBLR_KEY']
  end
end
