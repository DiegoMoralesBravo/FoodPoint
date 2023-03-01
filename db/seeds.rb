# Tables
# tables = Table.create([{ name: "Mesa A", size: 5 }, 
#                       { name: "Mesa B", size: 2 },
#                       { name: "Mesa C", size: 4 },
#                       { name: "Mesa D", size: 6 },
#                       { name: "Mesa E", size: 8 }])

# Items
# items = Item.create([{ name: "Hamburguesa", price: 70, category: "Comida", image: "URL" }, 
#                     { name: "Sprite", price: 15, category: "Bebida", image: "URL" },
#                     { name: "Pay de queso", price: 45, category: "Postre", image: "URL" },
#                     { name: "Pizza", price: 120, category: "Comida", image: "URL" },
#                     { name: "Cafe", price: 30, category: "Bebida", image: "URL" }])

#Orders
# orders = Order.create([{ tables_id: tables.first.id, status: "In progress", total: nil, note: "Hamburguesa sin pepinillos" }, 
#                       { tables_id: tables.second.id, status: "In progress", total: nil, note: "Pizza con champiñones" },
#                       { tables_id: tables.third.id, status: "In progress", total: nil, note: "Cafe sin azucar" },
#                       { tables_id: tables.fourth.id, status: "In progress", total: nil, note: "Hamburguesa sin verdura y con captsun" },
#                       { tables_id: tables.fifth.id, status: "In progress", total: nil, note: "Traer el refresco cuando este la comida" }])
# orders = Order.create([{ tables_id: 2, status: "In progress", total: 234, note: "Mind what no by kept." }, 
#                       { tables_id: 3, status: "In progress", total: 123, note: " Celebrated no he decisively thoroughly." },
#                       { tables_id: 4, status: "In progress", total: 234, note: "Our asked sex point her she seems." },
#                       { tables_id: 1, status: "In progress", total: 432, note: "New plenty she horses parish design you." },
#                       { tables_id: 5, status: "In progress", total: 213, note: "Stuff sight equal of my woody." }])
# orders = Order.create([{ tables_id: 2, status: "In progress", total: 65, note: "Mind what no by kept." }, 
#                       { tables_id: 3, status: "In progress", total: 231, note: "Celebrated no he decisively thoroughly." },
#                       { tables_id: 4, status: "In progress", total: 43, note: "Our asked sex point her she seems." },
#                       { tables_id: 1, status: "In progress", total: 123, note: "New plenty she horses parish design you." },
#                       { tables_id: 5, status: "In progress", total: 876, note: "Stuff sight equal of my woody." }])

# #Ordersitems
# OrdersItem.create(orders_id: orders.first.id , items_id: items.second.id)
# OrdersItem.create(orders_id: orders.third.id , items_id: items.second.id)
# OrdersItem.create(orders_id: orders.fifth.id , items_id: items.fourth.id)
# OrdersItem.create(orders_id: orders.second.id , items_id: items.first.id)
# OrdersItem.create(orders_id: orders.fourth.id , items_id: items.fifth.id)

# User
# User.create!({:email => "admin@gmail.com", :password => "123456", :password_confirmation => "123456" })
