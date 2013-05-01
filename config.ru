require "bundler"
Bundler.require

$stdout.sync = true

require "./iapps"

map "/assets" do
  run IApps.sprockets
end

map "/" do
  run IApps
end
