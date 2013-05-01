require "bundler"
Bundler.require

require "./iapps"

map "/assets" do
  run IApps.sprockets
end

map "/" do
  run IApps
end
