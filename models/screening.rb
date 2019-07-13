require_relative('../db/sql_runner')
require_relative('film')

class Screening

attr_accessor :film_id
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

end
