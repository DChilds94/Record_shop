require_relative("../db/sqlrunner.rb")
require_relative("./artist.rb")
require("pry-byebug")

class Album

attr_reader :id
attr_accessor :title, :stock, :artist_

def initialize(options)
  @id = options['id'].to_i if options['id']
  @title = options['title']
  @stock = options['stock'].to_i
  @artist_id = options['artist_id'].to_i
end



  def save()
    sql = "INSERT INTO albums (title, stock, artist_id) VALUES ($1, $2, $3) RETURNING id"
    values = [@title, @stock, @artist_id]
    result = SqlRunner.run(sql, values)
    @id = result.first['id'].to_i
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM albums WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    return Album.new(result.first)
  end

  def self.show_all()
    sql = "SELECT * FROM albums"
    albums = SqlRunner.run(sql)
    return albums.map {|album| Album.new(album)}
  end
  #
  # def self.find_by_artist(artist_id)
  #   sql = "SELECT * FROM artists WHERE id= $1"
  #   values = [@id]
  #   result = SqlRunner.run(sql, values)
  #   return result.map {|result| Album.new(result)}
  # end

  def self.delete_all()
    sql = "DELETE FROM albums"
    SqlRunner.run(sql)
  end



end #end of class
