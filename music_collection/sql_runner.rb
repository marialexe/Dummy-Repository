require('pg')
# require('pry-byebug')

class SqlRunner

  def SqlRunner.run(sql)
    begin
      db = PG.connect({dbname:'music_collection', host:'localhost'})
      result=db.exec(sql)
    ensure
      db.close()
    end
    return result
  end
# the result is an array of hashes !!!
end
# binding.pry
