class Show < ActiveRecord::Base
  def year
    show_date.year
  end

  def month
    show_date.strftime('%m')
  end

  def day
    show_date.strftime('%d')
  end

  def full_path
    {:year => year, :month => month, :day => day, :id => id}
  end
end
