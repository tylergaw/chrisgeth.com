class HomeController < ApplicationController
  include TumblrHelper

  def index
    @posts = res = tb_client.posts(BlogURL, limit: 2, tag: WhitelistTag)['posts']
    @shows = Show.where("show_date >= ?", Time.zone.now.to_date).limit(3).order("show_date")
  end
end
