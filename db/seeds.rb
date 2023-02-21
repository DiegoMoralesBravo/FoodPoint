# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Tables
tables = Table.create([{ name: "Mesa A", size: 5 }, 
                      { name: "Mesa B", size: 2 },
                      { name: "Mesa C", size: 4 },
                      { name: "Mesa D", size: 6 },
                      { name: "Mesa E", size: 8 }])

#Items 
items = Item.create([{ name: "Hamburguesa", price: 70, category: "Comida", image: "URL" }, 
                    { name: "Sprite", price: 15, category: "Bebida", image: "URL" },
                    { name: "Pay de queso", price: 45, category: "Postre", image: "URL" },
                    { name: "Pizza", price: 120, category: "Comida", image: "URL" },
                    { name: "Cafe", price: 30, category: "Bebida", image: "URL" }])

#Orders
orders = Order.create([{ tables_id: tables.first.id, status: "In progress", total: nil, note: "Hamburguesa sin pepinillos" }, 
                      { tables_id: tables.second.id, status: "In progress", total: nil, note: "Pizza con champiñones" },
                      { tables_id: tables.third.id, status: "In progress", total: nil, note: "Cafe sin azucar" },
                      { tables_id: tables.fourth.id, status: "In progress", total: nil, note: "Hamburguesa sin verdura y con captsun" },
                      { tables_id: tables.fifth.id, status: "In progress", total: nil, note: "Traer el refresco cuando este la comida" }])

#Ordersitems
OrdersItem.create(orders_id: orders.first.id , items_id: items.second.id)
OrdersItem.create(orders_id: orders.third.id , items_id: items.second.id)
OrdersItem.create(orders_id: orders.fifth.id , items_id: items.fourth.id)
OrdersItem.create(orders_id: orders.second.id , items_id: items.first.id)
OrdersItem.create(orders_id: orders.fourth.id , items_id: items.fifth.id)
