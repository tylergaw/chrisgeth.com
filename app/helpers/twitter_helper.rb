module TwitterHelper
  include Twitter::Autolink
  def tw_client
    tw_client = Twitter::REST::Client.new do |config|
      config.consumer_key = ENV['TWITTER_KEY']
      config.consumer_secret = ENV['TWITTER_SECRET']
    end
  end

  def get_latest_tweet
    @tweet = tw_client.user_timeline('chrisgethard', :count => 1)[0]
    @tweet_url = "https://twitter.com/#{@tweet.user.screen_name}/status/#{@tweet.id}"
    # puts @tweet.to_yaml
  end
end
