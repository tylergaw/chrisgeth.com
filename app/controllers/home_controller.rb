class HomeController < ApplicationController
  include TumblrHelper

  def index
    @posts = res = tb_client.posts(tb_url, limit: 1)['posts']
    @show = Show.where("show_date >= ?", Time.zone.now.to_date).first
  end
end
