class ShowsController < ApplicationController
  layout :resolve_layout

  def index
    @shows = Show.where("show_date >= ?", Time.zone.now.beginning_of_day)
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
