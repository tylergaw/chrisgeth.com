module ApplicationHelper
  include Twitter::Autolink

  def time_ago(time, append = ' ago')
    return time_ago_in_words(time).gsub(/about|less than|almost|over/, '')
      .strip << append
  end

  def title_char_class
    chars = ['andy', 'freddie', 'hills', 'morrissey', 'multiman', 'rickman',
      'roddy', 'willem']
    return "title-#{chars.sample}"
  end

  def rev_manifest(asset_type, asset_key)
    file_name = "#{Rails.public_path + asset_type}/rev-manifest.json"
    json_text = File.read(file_name)
    json = JSON.parse(json_text)
    return json[asset_key]
  end

  def rev_manifest_css(filename)
    return "/css/#{rev_manifest("css", filename)}"
  end
end
