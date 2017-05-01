# require('pg')
require_relative('../db/SqlRunner.rb')
require_relative('film.rb')
require_relative('ticket.rb')

class Customer

attr_reader :id
attr_accessor :name, :funds

#1. Create Customer 
  def initialize(params)
    @name = params['name']
    @funds = params['funds'].to_i
    @counter = 0
    @ticket_counter = 0
  end

# -------------------INSTANCE-METHODS----------------------

#2. Save Customer - instance method
  def save()
    sql = "INSERT INTO customers (name,funds) VALUES ('#{@name}',#{@funds}) RETURNING id;"
    @id=SqlRunner.run(sql).first['id'].to_i
  end

#3. Update Customer - instance method
  def update()
    sql = "UPDATE customers SET (name, funds) = ('#{@name}','#{funds}') WHERE id=#{@id};"
    SqlRunner.run(sql)
  end

#4. Delete Customer - instance method
  def delete()
    sql= "DELETE FROM customers WHERE id=#{@id};"
    SqlRunner.run(sql)
  end

#5. Display the film a customer booked to see
  def film()
    sql ="SELECT f.* FROM films f INNER JOIN tickets t ON t.film_id=f.id INNER JOIN customers c ON c.id=t.customer_id WHERE c.name='#{@name}';"
    film_array = SqlRunner.run(sql)
    result = film_array.map {|film| Film.new(film)}
    return result
  end

#6. Decrease the customer funds when buying film tickets

  #6a. valid ONLY if a customer booked ONLY one movie
    def book_one_movie()
      film_price = film().first().price()
      @funds-=film_price
      update()
    end

  #6b. valid even if the customr booked multiple movies, BUT DOESN'T TAKE INTO ACCOUNT FUNDS RUNNING OUT
  def book_multiple_movies1()
    films_booked = film()
    films_booked.each {|film_booked| @funds-=film_booked.price()}
    update()
  end

  #6c. valid for customers booking multiple movies and flags when customers run out of money. Doesn't allow the transaction! 
  # MOST COMPLETE METHOD OUT OF THE TRHEE
  def book_multiple_movies2()
    films_booked = film()
    films_booked.each do |film_booked|
      if @funds>=film_booked.price 
        @funds-=film_booked.price()
        puts "#{@funds}"
      else 
        films_booked.pop()
      puts "#{@funds}"
      end
    end
    update()
  end

#7. Output number of tickets bought by a customer
  def tickets_bought
    sql = "SELECT t.* FROM tickets t INNER JOIN customers c ON c.id=t.customer_id WHERE c.id=#{@id};"
    tickets_bought = SqlRunner.run(sql)
    result = tickets_bought.map {|ticket| Ticket.new(ticket)}
    fin_result = result.length()
    return fin_result
  end

#8. Output number of films booked by a customer
  def films_per_customer
    films_booked = film()
    films_booked.each {|film_booked| @counter += 1}
    return @counter
  end

# ---------------------CLASS-METHODS----------------------

#9. Delete all Customers - class method
  def Customer.delete_all()
    sql = "DELETE FROM customers;"
    SqlRunner.run(sql)
  end

#10. Read all Customers - class method
  def Customer.all()
    sql = "SELECT * FROM customers;"
    array_hashes = SqlRunner.run(sql)
    result = array_hashes.map {
      |customer| Customer.new (customer)}
    return result
  end

#11. Read Customer by id from the Customers table - class method
  def Customer.find(id)
    sql="SELECT * FROM customers WHERE id = #{id};"
    customer_hash = SqlRunner.run(sql).first()
    result = Customer.new(customer_hash)
    return result
  end

#12. Read Customer by its name from the Customers table - class method => the output can be one or more object instances
  def Customer.find_name(name)
    sql = "SELECT * FROM customers WHERE name='#{name}';"
    customers_array = SqlRunner.run(sql)
    result = customers_array.map {|customer| Customer.new(customer)}
    return result
  end

# ??!! 13. Read Customer by its funds from the Customers table - class method => the output can be one or more object instances
  def Customer.find_funds(funds)
    sql = "SELECT * FROM customers WHERE funds=#{funds};"
    customers_array = SqlRunner.run(sql)
    result = customers_array.map {|customer| Customer.new(customer)}
  end

end