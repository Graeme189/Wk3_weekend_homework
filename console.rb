require_relative('models/customer')
require_relative('models/ticket')
require_relative('models/ticket')

require('pry')

customer1 = Customer.new({'name' => 'Lola', 'funds' => 100})

customer2 = Customer.new({'name' => 'Dixie', 'funds' => 75})

customer3 = Customer.new({'name' => 'Joe', 'funds' => 150})
