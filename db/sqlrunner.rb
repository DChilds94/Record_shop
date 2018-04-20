require('pg')

class SqlRunner

def self.run(sql, values = [])
  begin
    db = PG.connect({dbname: "record_shop", host: "localhost"})
    db.prepare("query", values)
    result = db.exec_prepare("query", sql)
  ensure
    db.close() if db != nil
  end
  return result
end

end
