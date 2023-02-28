require 'faker'
require "open-uri"

#Tables
#tables = Table.create([{ name: "Mesa A", size: 5 }, 
#                      { name: "Mesa B", size: 2 },
#                       { name: "Mesa C", size: 4 },
#                      { name: "Mesa D", size: 6 },
#                      { name: "Mesa E", size: 8 }])

#Items
#items = Item.create([{ name: "Hamburguesa", price: 70, category: "Comida", image: "URL" }, 
#                    { name: "Sprite", price: 15, category: "Bebida", image: "URL" },
#                    { name: "Pay de queso", price: 45, category: "Postre", image: "URL" },
#                    { name: "Pizza", price: 120, category: "Comida", image: "URL" },
#                    { name: "Cafe", price: 30, category: "Bebida", image: "URL" }])


#Orders
#orders = Order.create([{ tables_id: tables.first.id, status: "In progress", total: nil, note: "Hamburguesa sin pepinillos" }, 
#                      { tables_id: tables.second.id, status: "In progress", total: nil, note: "Pizza con champiñones" },
#                      { tables_id: tables.third.id, status: "In progress", total: nil, note: "Cafe sin azucar" },
#                      { tables_id: tables.fourth.id, status: "In progress", total: nil, note: "Hamburguesa sin verdura y con captsun" },
#                      { tables_id: tables.fifth.id, status: "In progress", total: nil, note: "Traer el refresco cuando este la comida" }])

#OrdersItem.create(orders_id: orders.first.id , items_id: items.second.id)
#OrdersItem.create(orders_id: orders.third.id , items_id: items.second.id)
#OrdersItem.create(orders_id: orders.fifth.id , items_id: items.fourth.id)
#OrdersItem.create(orders_id: orders.second.id , items_id: items.first.id)
#OrdersItem.create(orders_id: orders.fourth.id , items_id: items.fifth.id)

User.create({:email => "admin@gmail.com", :password => "123456", :password_confirmation => "123456" })

#numberTables = 10

#numberitemsfood = 10
#numberitemsdessert = 20
#numberitemsdrink = 5
#totalnumberitems = numberitemsfood + numberitemsdessert + numberitemsdrink

#numberOrders = numberTables

# Tables
#(numberTables).times do |i|
#  Table.create(
#    name: Faker::Ancient.unique.god, 
#    size: Faker::Number.between(from: 2, to: 10))
#end

#Items Food
#10.times do
#  item = Item.create(
#    name: Faker::Food.unique.dish, 
#    price: Faker::Number.between(from: 50, to: 200), 
#    category: 'Food')
#  item.image.attach(
#    io:  File.open(File.join(Rails.root,'/app/assets/images/pasta.jpg')),
#    filename: 'pasta.jpg')
#  end

#Items Dessert
#numberitemsdessert.times do |i|
#  Item.create(
#    name: Faker::Dessert.unique.variety, 
#    price: Faker::Number.between(from: 20, to: 100), 
#    category: 'dessert')
#end

#Items drinks
#numberitemsdrink.times do |i|
#  Item.create(
#    name: Faker::Beer.unique.brand, 
#    price: Faker::Number.between(from: 1, to: 50), 
#    category: 'drink')
#end

#numberOrders.times do |i|
#  Order.create(
#    tables_id: i+1,
#    status: Faker::Boolean.boolean(true_ratio: 0.5),
#    total: Faker::Number.between(from: 300, to: 1000),
#    note: Faker::Food.description
#  )
#end

#Ordersitems

#numberOrders.times do |i|
#  howmanyitems = Faker::Number.between(from: 3, to: 6)
#  howmanyitems.times do |j|
#    itemID = Faker::Number.between(from: 1, to: totalnumberitems)
#    OrdersItem.create(orders_id: i+1  , items_id: itemID)
#  end
#end 

5.times do
  item = Item.create(
    name: Faker::Dessert.unique.variety,
    price: Faker::Number.between(from: 20, to: 100),
    category: 'dessert'
    )
  item.image.attach(
    io: File.open('app/assets/images/pasta.jpg'),
    filename: 'p.jpg'
  )
end
