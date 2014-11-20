class ShowsController < ApplicationController
  def index
    @shows = Show.where("show_date >= ?", Time.zone.now.beginning_of_day - 1)
  end

  def show
    @show = Show.find(params[:id])
  end
end
