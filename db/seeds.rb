# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

numberTables = 10

numberitemsfood = 10
numberitemsdessert = 20
numberitemsdrink = 5
totalnumberitems = numberitemsfood + numberitemsdessert + numberitemsdrink

numberOrders = numberTables

# Tables
(numberTables).times do |i|
  Table.create(
    name: Faker::Ancient.unique.god, 
    size: Faker::Number.between(from: 2, to: 10))
end

#Items Food
numberitemsfood.times do |i|
  Item.create(
    name: Faker::Food.unique.dish, 
    price: Faker::Number.between(from: 50, to: 200), 
    category: 'Food', 
    image: 'URL')
end

#Items Dessert
numberitemsdessert.times do |i|
  Item.create(
    name: Faker::Dessert.unique.variety, 
    price: Faker::Number.between(from: 20, to: 100), 
    category: 'dessert', 
    image: 'URL')
end

#Items drinks
numberitemsdrink.times do |i|
  Item.create(
    name: Faker::Beer.unique.brand, 
    price: Faker::Number.between(from: 1, to: 50), 
    category: 'drink', 
    image: 'URL')
end

def randstatus
  ns = rand(1..3)
  status = ' '
  if ns == 1
    status = 'wait'
  elsif ns == 2
    status = 'progress'
  elsif ns == 3
    status = 'done'
  end
  status
end

numberOrders.times do |i|
  Order.create(
    tables_id: i+1,
    status: randstatus,
    total: Faker::Number.between(from: 300, to: 1000),
    note: Faker::Food.description
  )
end

#Ordersitems

numberOrders.times do |i|
  howmanyitems = Faker::Number.between(from: 3, to: 6)
  howmanyitems.times do |j|
    itemID = Faker::Number.between(from: 1, to: totalnumberitems)
    OrdersItem.create(orders_id: i+1  , items_id: itemID)
  end
end

#User
User.create({:email => "admin@gmail.com", :password => "123456", :password_confirmation => "123456" })
