class ShowsController < ApplicationController
  layout :resolve_layout

  def index
    @shows = Show.where("show_date >= ?", Time.zone.now.to_date)
  end

  def shows_by_year
    @shows = Show.where('extract(year from show_date) = ?', params[:year])
    render :template => "shows/index"
  end

  def shows_by_month
    @shows = Show.where('extract(year from show_date) = ? and extract(month from show_date) = ?',
      params[:year], params[:month])
    render :template => "shows/index"
  end

  def shows_by_day
    @shows = Show.where('extract(year from show_date) = ? and extract(month from show_date) = ? and extract(day from show_date) = ?',
      params[:year], params[:month], params[:day])
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
