require_relative('../db/SqlRunner.rb')
require_relative('customer.rb')
require_relative('screening.rb')

class Film

  attr_reader :id
  attr_accessor :title, :price

#1. Create - instance method of class Film
  def initialize(params)
    @title = params['title']
    @price = params['price'].to_i
    @counter = 0
  end

# -------------------INSTANCE-METHODS----------------------

#2. Save - instance method of class Film
  def save()
    sql = "INSERT INTO films (title,price) VALUES ('#{title}',#{price}) RETURNING id;"
    film_hash = SqlRunner.run(sql).first()
    @id = film_hash['id'].to_i
  end

#3. Update - instance method of class Film
  def update()
    sql = "UPDATE films SET (title,price) = ('#{@title}',#{price}) WHERE id=#{@id};"
    SqlRunner.run(sql)
  end

#4. Delete by id - instance method of class Film
  def delete()
    sql = "DELETE FROM films WHERE id=#{@id};"
    SqlRunner.run(sql)
  end

#5. Delete by film_id - instance method of class film
  def delete_film_id
    sql = "DELETE FROM films WHERE film_id = #{@film_id};"
    SqlRunner.run(sql)
  end

#6. Display the customers who booked a certain film
  def customer()
    sql = "SELECT c.* FROM customers c INNER JOIN tickets t ON t.customer_id=c.id INNER JOIN films f ON f.id=t.film_id WHERE f.title='#{@title}';"
    customer_array=SqlRunner.run(sql)
    result = customer_array.map {|customer| Customer.new(customer)}
    return result
  end

#7. Check how many customers are going to watch a certain film
  def customers_per_film
    customers_booked_in = customer()
    @counter = customers_booked_in.length()
    return @counter
    # return customer().lenght()
  end

# 8. Output the most popular time (most tickets sold) for a given film
  def most_popular_time()
    films_array=Film.all()
    films_array.each {|film|
      tickets_array = Screening.tickets_all()
      most_popular = tickets_array.max()}
      return most_popular
  end

# ---------------------CLASS-METHODS----------------------

#9. Delete - Film.delete_all - Film class method
  def Film.delete_all()
    sql = "DELETE FROM films;"
    SqlRunner.run(sql)
  end

#10. Read/List ALL instances in class Film - class method 
  def Film.all()
    sql = "SELECT * FROM films;"
    films_array = SqlRunner.run(sql)
    result = films_array.map { |film| Film.new(film)}
    return result
  end

#11. Read/List AN/ONE instance in the class Film by its id - class method => returns AN/ONE instance object
  def Film.find(id)
    sql = "SELECT * FROM films WHERE id=#{id};"
    film_hash =SqlRunner.run(sql).first()
    result = Film.new(film_hash)
    return result
  end

#12. Read/List instance(s) in the class Film by its title - class method => returns ONE OR MORE instance objects
  def Film.find_title(title)
    sql = "SELECT * FROM films WHERE title='#{title}';"
    films_array=SqlRunner.run(sql)
    result = films_array.map {|film_hash| Film.new(film_hash)}
    return result
  end

# ??!! 13. Read/List instance(s) in the class Film by its price - class method => returns ONE OR MORE instance objects
  def Film.find_price(price)
    sql = "SELECT * FROM films WHERE price=#{price};"
    films_array=SqlRunner.run(sql)
    result = films_array.map {|film_hash| Film.new(film_hash)}
    return result
  end

end