require_relative("../db/sqlrunner.rb")

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


end #end of the class
