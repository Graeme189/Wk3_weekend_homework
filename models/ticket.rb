require_relative('../db/sql_runner')
require_relative('film')
require_relative('customer')

class Ticket

  attr_accessor :customer_id, :film_id
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @customer_id = options['customer_id'].to_i
    @film_id = options['film_id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM tickets"
    values = []
    SqlRunner.run(sql, values)
  end

  def customer()
      sql = "SELECT * FROM customers WHERE id = $1;"
      values = [@customer_id]
      customer = SqlRunner.run(sql, values).first
      return Customer.new(customer)
    end

    def film()
      sql = "SELECT * FROM films WHERE id = $1;"
      values = [@film_id]
      film = SqlRunner.run(sql, values).first
      return Film.new(film)
    end

  def save()
    sql = "INSERT INTO tickets (customer_id, film_id)
    VALUES ($1, $2)
    RETURNING id;"
    values = [@customer_id, @film_id]
    ticket = SqlRunner.run( sql, values ).first
    @id = ticket['id'].to_i
  end

  def films()
    sql = "SELECT films.*
    FROM films
    INNER JOIN tickets
    ON tickets.film_id = films.id
    WHERE customer_id = $1;"
    values = [@id]
   	films = SqlRunner.run(sql, values)
  	result = films.map { |film| Film.new( film ) }
  	return result
  end

  def customer()
    sql = "SELECT customers.*
    FROM customers
    INNER JOIN tickets
    ON tickets.customer_id = customers.id
    WHERE film_id = $1;"
    values = [@id]
   	customers = SqlRunner.run(sql, values)
  	result = customers.map { |customer| Customer.new( customer ) }
  	return result
  end


end
