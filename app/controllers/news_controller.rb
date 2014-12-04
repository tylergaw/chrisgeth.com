class NewsController < ApplicationController
  include TumblrHelper

  def index
    page = (params[:page]) ? params[:page].to_i : 1
    per_page = 10
    offset = (per_page * page) - 1

    res = tb_client.posts('thechrisgethardshow.tumblr.com', :offset => offset,
      :limit => per_page)

    total = res['total_posts']
    total_pages = (total.to_f / per_page).floor
    @prev_page = (page > 1) ? (page - 1) : nil
    @next_page = (total_pages > 1 && page < total_pages) ? (page + 1) : nil

    @posts = res['posts']
  end

  def show

  end
end