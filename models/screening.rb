require_relative('../db/sql_runner')
require_relative('film')

class Screening

attr_accessor :film_id, :timing
attr_reader :id

def initialize(options)
  @id = options['id'].to_i if options['id']
  @film_id = options['film_id'].to_i
  @timing = options['timing']
end

def save()
  sql = "INSERT INTO screenings (film_id, timing)
  VALUES ($1, $2)
  RETURNING id;"
  values = [@film_id, @timing]
  screening = SqlRunner.run(sql, values).first
  id = screening['id'].to_i
end

def self.all
  sql = "SELECT * FROM screenings;"
  values = []
  screenings = SqlRunner.run(sql, values)
  result = screenings.map { |screening| Screening.new(screening) }
end

def update()
  sql = "UPDATE screenings
  SET (film_id, timing) = ($1, $2)
  WHERE id = $3;"
  values = [@film_id, @timing]
  SqlRunner.run(sql, values)
end

def self.delete_all()
  sql = "DELETE FROM screenings"
  values = []
  SqlRunner.run(sql, values)
end

end
