class ShowsController < ApplicationController
  layout :resolve_layout

  # TODO: Clean this up a bit so you don't have to order() on every one

  def index
    @shows = Show.where("show_date >= ?", Time.zone.now.to_date).order("show_date")
  end

  def shows_by_year
    @shows = Show.where('extract(year from show_date) = ?', params[:year]).order("show_date")
    render :template => "shows/index"
  end

  def shows_by_month
    @shows = Show.where('extract(year from show_date) = ? and extract(month from show_date) = ?',
      params[:year], params[:month]).order("show_date")
    render :template => "shows/index"
  end

  def shows_by_day
    @shows = Show.where('extract(year from show_date) = ? and extract(month from show_date) = ? and extract(day from show_date) = ?',
      params[:year], params[:month], params[:day]).order("show_date")
    render :template => "shows/index"
  end

  def show
    @show = Show.find(params[:id])
  end

  private

    def resolve_layout
      case action_name
      when "show"
        "show"
      else
        "application"
      end
    end
end
