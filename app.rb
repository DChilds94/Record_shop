require("sinatra")
require("sinatra/contrib/all")

require_relative("./models/album.rb")
require_relative("./models/artist.rb")


#index
get "/home" do
  erb(:home)
end

get "/home/:stock" do
  # @artists = Artist.all()
  @albums = Album.show_all()
  erb(:stock)
end

#new


#show
get "/stock/:artist" do
  "Display artists"
end


#CREATE



#edit




#UPDATE




#destroy
