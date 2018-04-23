require_relative("../db/sqlrunner.rb")
require_relative("./album.rb")
require("pry-byebug")

class Artist

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO artists (name) VALUES ($1) RETURNING id"
    values = [@name]
    result = SqlRunner.run(sql, values)
    @id = result.first['id'].to_i
  end


  def self.find_by_id(id)
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    return Artist.new(result.first)
  end

  def find_albums()
    sql = "SELECT * FROM albums WHERE artist_id = $1"
    values = [@id]
    albums = SqlRunner.run(sql, values)
    return albums.map{|album| Album.new(album)}
  end

  def self.show_all()
      sql = "SELECT * FROM artists"
      results = SqlRunner.run(sql)
      return results.map {|result| Artist.new(result) }
  end

  def self.delete_all()
      sql = "DELETE FROM artists"
      SqlRunner.run(sql)
  end

  def self.delete_artist(id)
      sql = "DELETE FROM artists WHERE id = $1;"
      values = [@id]
      SqlRunner.run(sql, values)
  end

    def update()
      sql = "UPDATE artists SET name = $1 WHERE id = $2"
      values = [@name, @id]
      SqlRunner.run(sql, values)
    end
    # method is displaying a change however, not able to save the update in db - check on Monday
  end
