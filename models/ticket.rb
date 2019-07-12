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

  def customer()
      sql = "SELECT * FROM customers WHERE id = $1;"
      values = [@customer_id]
      customer = SqlRunner.run(sql, values).first
      return Customer.new(customer)
    end

    def film()
      sql = "SELECT * FROM films WHERE id = $1;"
      values = [@film_id]
      user = SqlRunner.run(sql, values).first
      return Film.new(film)
    end



  # def save()
  #   sql = "INSERT INTO tickets (customer_id, film_id)
  #   VALUES ($1, $2)
  #   RETURNING id"
  #   values = [@customer_id, @film_id]
  #   ticket = SqlRunner.run( sql, values ).first
  #   @id = ticket['id'].to_i
  # end



end
