class StaticPagesController < ApplicationController
  def about
  end

  def articles
  end

  def merch
  end

  def fans
  end

  def purpose
  end

  def contact
  end

  def temp_home
    render :layout => false
  end
end
