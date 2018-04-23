require("sinatra")
require("sinatra/contrib/all")

require_relative("./models/album.rb")
require_relative("./models/artist.rb")
require_relative("controllers/album_controller.rb")
require_relative("controllers/artist_controller.rb")


#index
get "/" do
  erb(:index)
end

get "/home/stock" do
  @albums = Album.show_all()
  erb(:home/stock)
end



#new


#show
# get "/home/artist" do
#   @artists = Artist.show_all()
#   erb(:artist)
# end

# get "/home/artist/:id" do
#   @artist = Artist.find_by_id(params["id"].to_i)
#   @albums = Album.show_all()
#   erb(:show_albums)
# end
#

#CREATE



#edit




#UPDATE




#destroy
