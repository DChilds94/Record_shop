require("sinatra")
require("sinatra/contrib/all")
require_relative("../models/album.rb")
require_relative("../models/artist.rb")

get "/stock" do
  @albums = Album.show_all()
  erb(:"Albums/stock")
end

get "/stock/new" do
  @artists = Artist.show_all()
  erb(:"Albums/new")
end


get "/stock/:id/manage" do
  @artists = Artist.show_all()
  @albums = Album.show_all()
  @album = Album.find_by_id(params[:id])
  erb(:"Albums/manage")
end


post "/stock" do
  album = Album.new(params)
  album.save()
  redirect to "/stock"
end

post "/stock/manage" do
  album = Album.new(params)
  album.update()
  redirect to "/stock"
end

post "/stock/:id/delete" do
  album = Album.find_by_id(params['id'])
  album.delete
  redirect to "/stock"
end
