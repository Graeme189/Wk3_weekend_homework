require_relative('models/customer')
require_relative('models/film')
require_relative('models/ticket')

require('pry')

Customer.delete_all()
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

ticket1 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film1.id})
ticket1.save()

ticket2 = Ticket.new({'customer_id' => customer2.id, 'film_id' => film1.id})
ticket2.save()

ticket3 = Ticket.new({'customer_id' => customer3.id, 'film_id' => film1.id})
ticket3.save()

ticket4 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film2.id})
ticket4.save()


binding.pry
nil
