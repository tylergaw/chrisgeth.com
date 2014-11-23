class ShowsController < ApplicationController
  layout :resolve_layout

  def index
    @shows = Show.where("show_date >= ?", Time.zone.now.to_date)
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
