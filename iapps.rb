require "open-uri"

class IApps < Sinatra::Base
  set :sprockets, Sprockets::Environment.new
  helpers Sprockets::Helpers

  configure do
    Sprockets::Helpers.configure do |config|
      config.environment = sprockets
      config.prefix = "/assets"
      config.digest = true
    end

    sprockets.append_path "assets/javascripts"
    sprockets.append_path "assets/stylesheets"
  end

  get "/search" do
    puts "[Search] #{params[:query]}"

    endpoint = ENV["ENDPOINT"]
    query    = Rack::Utils.escape(params[:query])

    open("#{endpoint}#{query}").read
  end

  get "/" do
    haml :index
  end
end
