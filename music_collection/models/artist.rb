# require('pg')
require_relative('../sql_runner')

class Artist

attr_reader :id
attr_accessor :name

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @name = params['name']
  end

# returns the newly created id in the database and assigned to the instance variable @id
  def save()
    sql="
    INSERT INTO artists (name) 
    VALUES ('#{@name}') 
    RETURNING id;"
    array_hashes = SqlRunner.run(sql)
    hash = array_hashes.first()
    @id = hash["id"].to_i
  end

  def album()

  end

  def update ()
    sql= "UPDATE artists SET name = #{@name} WHERE id=#{@id};"
    SqlRunner.run(sql)
  end

  def delete()
    sql="DELETE FROM artists WHERE id=#{@id};"
    SqlRunner.run(sql)
  end

  def Artist.all()
    sql="SELECT * FROM artists;"
    SqlRunner.run(sql)
  end

# returns the hash from the database for the selected id and assigns it to an Artist object
  def Artist.find()
    sql="SELECT * FROM artists WHERE id=#{@id};"
    array_hashes = SqlRunner.run(sql)
    hash = array_hashes.first()
    result = Artist.new(hash)
    return result
  end

  def Artist.delete_all()
    sql = "DELETE FROM artists;"
    SqlRunner.run(sql)
    return nil
  end
 

end