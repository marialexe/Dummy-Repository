require_relative('../models/pizza')
pizza1 = Pizza.new({
  "first_name" => "Walter",
  "last_name" => "White",
  "topping" => "Pepperoni",
  "quantity" => 1
})

pizza2 = Pizza.new({
  "first_name" => "Jesse",
  "last_name" => "Pinkman",
  "topping" => "Italian Sausage",
  "quantity" => 12
})

pizza1.save
pizza2.save

pizza3 = Pizza.new({
  "first_name" => "Craig",
  "last_name" => "Morton",
  "topping" => "Veggie",
  "quantity" => 3
})

pizza3.save