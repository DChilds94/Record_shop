require("sinatra")
require("sinatra/contrib/all")
require_relative("../models/album.rb")
require_relative("../models/artist.rb")

get "/artist" do
  @artists = Artist.show_all()
  erb(:"Artist/artist")
end

get "/home/artist/:id" do
  @artist = Artist.find_by_id(params["id"].to_i)
  @albums = Album.show_all
  erb(:"Artist/show_albums")
end
