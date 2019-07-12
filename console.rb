require_relative('models/customer')
require_relative('models/ticket')
require_relative('models/ticket')

require('pry')

customer1 = Customer.new({'name' => 'Lola', 'funds' => 100})
customer1.save()

customer2 = Customer.new({'name' => 'Dixie', 'funds' => 75})
customer2.save()

customer3 = Customer.new({'name' => 'Joe', 'funds' => 150})
customer3.save()

binding.pry
nil
