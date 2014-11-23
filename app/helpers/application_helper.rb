module ApplicationHelper
  include Twitter::Autolink

  def time_ago(time, append = ' ago')
    return time_ago_in_words(time).gsub(/about|less than|almost|over/, '')
      .strip << append
  end

  def title_char_class()
    chars = ['andy', 'freddie', 'hills', 'morrissey', 'multiman', 'rickman',
      'roddy', 'willem']
    return "title-#{chars.sample}"
  end
end
