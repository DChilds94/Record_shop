require_relative("../db/sqlrunner.rb")
require("pry-byebug")

class Artist

attr_reader :id
attr_accessor :name

def initialize(options)
  # @id = options['id'].to_i
  @name = options['name']
end

def save()
  sql = "INSERT INTO artists (name) VALUES ($1) RETURNING id"
  values = [@name]
  result = SqlRunner.run(sql, values)
  @id = result.first['id'].to_i
end

def self.show_all()
  sql = "SELECT * FROM artists"
  results = SqlRunner.run(sql)
  return results.map {|result| Artist.new(result) }
end 

# def delete_all()
#   sql = "DELETE * FROM artist"
#   SqlRunner.run(sql)
# end


end #end of the class

binding.pry
nil
