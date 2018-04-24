require("sinatra")
require("sinatra/contrib/all")
require_relative("../models/album.rb")
require_relative("../models/artist.rb")

get "/artist" do
  @artists = Artist.show_all()
  erb(:"Artist/artist")
end

get "/artist/:id" do
  @artist = Artist.find_by_id(params["id"])
  erb(:"Artist/show")
end

post "/artist/albums" do
  @id = Artist.find_by_name(params["name"])
  Artist.find_albums
end
