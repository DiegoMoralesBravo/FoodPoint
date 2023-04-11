require 'faker'
require "open-uri"


numberTables = 10

numberitemsfood = 10

numberitemsdessert = 8

numberitemsdrink = 15

totalnumberitems = numberitemsfood + numberitemsdessert + numberitemsdrink

numberOrders = numberTables

numberIngredients = 20

# Tables
(numberTables).times do |i|
  Table.create(
    name: Faker::Ancient.unique.god,
    size: Faker::Number.between(from: 2, to: 10))
end

def randstatus
  ns = rand(1..2)
  status = ' '
  if ns == 1
    status = 'wait'
  elsif ns == 2
    status = 'progress'
  end
  status
end


60.times do |i|
    Order.create(
      tables_id: i+1,
      status: randstatus,
      total: Faker::Number.between(from: 300, to: 1000),
      note: Faker::Food.description,
      created_at: i.days.ago.beginning_of_day
    )
end



#food
numberitemsfood.times do
  item = Item.create(
    name: Faker::Food.unique.dish,
    price: Faker::Number.between(from: 50, to: 200),
    category: 'Food',
    description:Faker::Food.description)
    item.image.attach(
      io: File.open('app/assets/images/pasta.jpg'),
      filename: 'p.jpg'
    )
  end

  #dessert
  numberitemsdessert.times do
    item = Item.create(
    name: Faker::Dessert.unique.variety,
    price: Faker::Number.between(from: 20, to: 100),
    category: 'Dessert',
    description:Faker::Food.description)
    item.image.attach(
      io: File.open('app/assets/images/caramel-topped-ice-cream.jpg'),
    filename: 'p.jpg'
  )
end

#Items drinks
numberitemsdrink.times do
  item = Item.create(
    name: Faker::Beer.unique.brand,
    price: Faker::Number.between(from: 1, to: 50),
    category: 'Drink',
    description: Faker::Food.description)
    item.image.attach(
      io: File.open('app/assets/images/beer.jpg'),
    filename: 'p.jpg'
  )
end

#Ordersitems
numberOrders.times do |i|
  howmanyitems = Faker::Number.between(from: 3, to: 6)
  howmanyitems.times do |j|
    itemID = Faker::Number.unique.between(from: 1, to: totalnumberitems)
    OrdersItem.create(order_id: i+1  , item_id: itemID, quantity: Faker::Number.between(from: 1, to: 3))
  end
  Faker::Number.unique.clear
end

#User
User.create({:email => "admin@gmail.com", :password => "123456", :password_confirmation => "123456" })

# Ingredients
Ingredient.create({:name => "Beef", :quant => "grams", :price => 0.12 })
Ingredient.create({:name => "Chicken", :quant => "grams", :price => 0.10 })
Ingredient.create({:name => "Bacon", :quant => "grams", :price => 0.11 })
Ingredient.create({:name => "Cheese", :quant => "grams", :price => 0.08 })
Ingredient.create({:name => "Onion", :quant => "grams", :price => 0.05 })
Ingredient.create({:name => "Tomato", :quant => "grams", :price => 0.07 })
Ingredient.create({:name => "Lettuce", :quant => "grams", :price => 0.08 })
Ingredient.create({:name => "Tomato sauce", :quant => "milliliters", :price => 0.05 })
Ingredient.create({:name => "BBQ sauce", :quant => "milliliters", :price => 0.08 })
Ingredient.create({:name => "Vegetable oil", :quant => "milliliters", :price => 0.02 })
Ingredient.create({:name => "Olive oil", :quant => "milliliters", :price => 0.15 })
Ingredient.create({:name => "Hot sauce", :quant => "milliliters", :price => 0.10 })
Ingredient.create({:name => "Mustard", :quant => "milliliters", :price => 0.04 })

numberIngredients.times do
  Ingredient.create(
    name: Faker::Food.ingredient,
    quant: 'grams',
    price: Faker::Number.between(from: 0.12, to: 0.05).round(2)
  )
end
