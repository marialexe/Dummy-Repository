# require('pg')
require_relative('../sql_runner')


class Album

  attr_reader :id, :artist_id
  attr_accessor :title, :genre

  def initialize(params)
    @id=params['id'].to_i if params['id']
    @title=params['title']
    @genre=params['genre']
    @artist_id=params['artist_id'].to_i 
  end

  # returns the newly created id in the database and assigned to the instance variable @id
  def save()
    sql=
    "
      INSERT INTO albums (
      title,
      genre,
      artist_id) VALUES ('#{@title}','#{@genre}',#{@artist_id}) RETURNING id;
    "
    array_hashes = SqlRunner.run(sql)
    hash = array_hashes.first()
    @id = hash["id"].to_i
  end

  def artist()

  end

  def update()
    sql = "
    UPDATE albums SET (
    title,
    genre,
    artist_id) = (
    '#{@title}',
    '#{@genre}',
    #{artist_id}) WHERE id=#{@id};"
    SqlRunner.run(sql)
  end

  def delete()
    sql="DELETE FROM albums WHERE id=#{@id};"
    SqlRunner.run(sql)
  end

  def Album.all()
    sql="SELECT * FROM albums;"
    SqlRunner.run(sql)
  end

  # returns the hash from the database for the selected id and assigns it to an Album object
  def Album.find()
    sql="SELECT * FROM albums WHERE id=#{@id};"
    array_hashes=SqlRunner.run(sql)
    hash=array_hashes.first()
    result = Album.new(hash)
    return result
  end

  def Album.delete_all()
    sql = "DELETE FROM albums;"
    SqlRunner.run(sql)
    return nil
  end

end