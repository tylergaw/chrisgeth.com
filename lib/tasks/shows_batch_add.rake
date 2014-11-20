require "json"

namespace :shows do
  desc "Create Shows from JSON input"
  task :batch_add, [:input] => :environment do |t, args|
    json_text = File.read(args.input)
    data = JSON.parse(json_text)

    data['shows'].each do |show|
      s = Show.new(show)
      s.save
    end
  end
end
