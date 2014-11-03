module ApplicationHelper
  include Twitter::Autolink

  def time_ago(time, append = ' ago')
    return time_ago_in_words(time).gsub(/about|less than|almost|over/, '')
      .strip << append
  end
end
