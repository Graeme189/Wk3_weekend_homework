require_relative("../db/sql_runner")

class Customer



  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @funds = options['funds']
  end


end