require_relative("../db/sqlrunner.rb")
require_relative("./artist.rb")
require("pry-byebug")

class Album

attr_reader :id
attr_accessor :title, :stock, :genre, :artist_id

def initialize(options)
  @id = options['id'].to_i if options['id']
  @title = options['title']
  @stock = options['stock'].to_i
  @genre = options["genre"]
  @artist_id = options['artist_id'].to_i
end

  def save()
    sql = "INSERT INTO albums (title, stock, genre, artist_id) VALUES ($1, $2, $3, $4) RETURNING id"
    values = [@title, @stock, @genre, @artist_id]
    result = SqlRunner.run(sql, values)
    @id = result.first['id'].to_i
  end

  def find()
    sql = "SELECT * FROM albums WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    return Album.new(result.first)
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

  def self.find_by_artist(artist_id)
    sql = "SELECT * FROM albums WHERE artist_id = $1"
    values = [artist_id]
    result = SqlRunner.run(sql, values)
    return result.map {|album_hash| Album.new(album_hash)}
  end

  def find_by_artist()
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [@artist_id]
    result = SqlRunner.run(sql, values)
    Artist.new(result.first).name
  end


  def check_stock()
    stock_level = @stock
    case
    when stock_level == 0
      return "Out of stock"
    when stock_level >= 50
      return "High"
    when stock_level >= 11
      return "Medium"
    when stock_level <= 10
      return "Low"
    end
end

  def update()
    sql = "UPDATE albums SET (title, stock, genre) = ($1, $2, $3) WHERE id = $4"
    values = [@title, @stock, @genre, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM albums"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM albums WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

end #end of class
