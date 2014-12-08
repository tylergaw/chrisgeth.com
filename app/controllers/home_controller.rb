class HomeController < ApplicationController
  include TumblrHelper

  def index
    @posts = res = tb_client.posts(tb_url, limit: 2)['posts']
    @shows = Show.where("show_date >= ?", Time.zone.now.to_date).limit(3)
  end
end
