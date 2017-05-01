require_relative('../db/SqlRunner.rb')

class Ticket

  attr_reader :id
  attr_accessor :customer_id, :film_id, :cinema, :type

#1. Create - instance method for class Ticket
  def initialize(params)
    @customer_id = params['customer_id'].to_i
    @film_id = params['film_id'].to_i
    @cinema = params['cinema']
    @type = params['type']
  end

# ------------------INSTANCE-METHODS-------------------

#2. Save - instance method for class Ticket
  def save()
    sql = "INSERT INTO tickets (customer_id,film_id,cinema,type) VALUES (#{@customer_id},#{@film_id},'#{@cinema}','#{@type}') RETURNING id;"
    ticket_hash = SqlRunner.run(sql).first()
    @id = ticket_hash['id'].to_i
  end

#3. Update - instance method for class Ticket
  def update()
    sql = "UPDATE tickets SET (customer_id,film_id,cinema,type) = (#{@customer_id},#{@film_id},'#{@cinema}','#{@type}') WHERE id=#{@id};"
    SqlRunner.run(sql)
  end

#4. Delete - instance method for class Ticket
  def delete()
    sql = "DELETE FROM tickets WHERE id=#{@id};"
    SqlRunner.run(sql)
  end

# -------------------CLASS-METHODS---------------------

#5. Delete - Ticket.delete_all() - class method => Nothing to return
  def Ticket.delete_all()
    sql = "DELETE FROM tickets;"
    SqlRunner.run(sql)
  end

#6. Read/List ALL the intances in class Tickets
  def Ticket.all()
    sql = "SELECT * FROM tickets;"
    tickets_array=SqlRunner.run(sql)
    result = tickets_array.map {|ticket| Ticket.new(ticket)}
    return result
  end

#7. Read/List ONE instance in class Tickets by id
  def Ticket.find(id)
    sql = "SELECT * FROM tickets WHERE id=#{id};"
    ticket_hash=SqlRunner.run(sql).first()
    result=Ticket.new(ticket_hash)
    return result
  end



end