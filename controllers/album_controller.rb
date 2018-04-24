require("sinatra")
require("sinatra/contrib/all")
require_relative("../models/album.rb")
require_relative("../models/artist.rb")

get "/stock" do
  @albums = Album.show_all()
  erb(:"Albums/stock")
end

get "/stock/new" do
  erb(:"Albums/new")
end

post "/stock" do
  album = Album.new(params)
  album.save()
  redirect to "/stock"
end
