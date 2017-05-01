require_relative('../db/SqlRunner.rb')
require_relative('ticket.rb')

class Screening

  attr_reader :id
  attr_accessor :film_time, :film_id, :max_capacity

  def initialize(params)
    @film_time = params['film_time']
    @film_id = params['film_id'].to_i
    @max_capacity = params['max_capacity'].to_i
  end

  def save()
    sql = "INSERT INTO screenings (film_time,film_id) VALUES ('#{@film_time}',#{@film_id}) RETURNING id;"
    show_hash = SqlRunner.run(sql).first()
    @id = show_hash['id'].to_i
  end

# 2a. Output the most popular time (most tickets sold) for a given film
  def tickets_per_screening()
    sql = "SELECT t.* FROM tickets t INNER JOIN films f ON t.film_id=f.id INNER JOIN screenings s ON s.film_id=f.id WHERE s.id = #{@id};"
    shows_array = SqlRunner.run(sql)
    result = shows_array.map {|show| Screening.new(show)}
    fin_result = result.length()
    return fin_result
  end 

  def Screening.delete_all()
    sql = "DELETE FROM screenings;"
    SqlRunner.run(sql)
  end

  def Screening.all()
    sql = "SELECT * FROM screenings;"
    SqlRunner.run(sql)
  end

# 2b. Output the most popular time (most tickets sold) for a given film
  def Screening.tickets_all()
    screenings_array = Screening.all()
    tickets_array = []
    screenings_array.each {|screening| tickets_sold=tickets_per_screening()
      tickets_array << tickets_sold}
    return tickets_array
  end

end