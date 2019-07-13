require_relative('models/customer')
require_relative('models/film')
require_relative('models/ticket')
require_relative('models/screening')

require('pry')

Customer.delete_all()
Screening.delete_all()
Film.delete_all()
Ticket.delete_all()


customer1 = Customer.new({'name' => 'Lola', 'funds' => 100})
customer1.save()

customer2 = Customer.new({'name' => 'Dixie', 'funds' => 75})
customer2.save()

customer3 = Customer.new({'name' => 'Joe', 'funds' => 150})
customer3.save()

film1 = Film.new({'title' => 'The Thing', 'price' => 20})
film1.save()

film2 = Film.new({'title' => 'A Fistful of Dollars', 'price' => 15})
film2.save()

film3 = Film.new({'title' => 'Miller\'s Crossing', 'price' => 25})
film3.save()

film4 = Film.new({'title' => 'Practical Magic', 'price' => 17})
film4.save()

ticket1 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film1.id})
ticket1.save()

ticket2 = Ticket.new({'customer_id' => customer2.id, 'film_id' => film1.id})
ticket2.save()

ticket3 = Ticket.new({'customer_id' => customer3.id, 'film_id' => film2.id})
ticket3.save()

ticket4 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film2.id})
ticket4.save()

ticket5 = Ticket.new({'customer_id' => customer3.id, 'film_id' => film3.id})
ticket5.save()

ticket6 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film4.id})
ticket6.save()

ticket7 = Ticket.new({'customer_id' => customer2.id, 'film_id' => film4.id})
ticket7.save()

screening1 = Screening.new({'film_id' => film1.id, 'timing' => '19:00'})
screening1.save()

screening2 = Screening.new({'film_id' => film1.id, 'timing' => '21:00'})
screening2.save()

screening3 = Screening.new({'film_id' => film2.id, 'timing' => '16:00'})
screening3.save

screening4 = Screening.new({'film_id' => film2.id, 'timing' => '19:00'})
screening4.save()

screening5 = Screening.new({'film_id' => film3.id, 'timing' => '20:00'})
screening5.save()

screening6 = Screening.new({'film_id' => film3.id, 'timing' => '23:00'})
screening6.save()

screening7 = Screening.new({'film_id' => film4.id, 'timing' => '14:00'})
screening7.save()

screening8 = Screening.new({'film_id' => film4.id, 'timing' => '18:00'})
screening8.save()

binding.pry
nil
