require 'faker'
require "open-uri"

totalDays= 2 * 30

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


numberOrders.times do |i|
  Order.create(
    tables_id: i+1,
    status: randstatus,
    total: Faker::Number.between(from: 300, to: 1000),
    note: Faker::Food.description,
    created_at: Date.today
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
  rand(1..3).times do |_|
    Recipe.create(id_item: item.id, id_ingredient: Faker::Number.unique.between(from: 1, to: numberIngredients), quantity: rand(100..300))
  end
  Faker::Number.unique.clear
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
  rand(1..3).times do |_|
    Recipe.create(id_item: item.id, id_ingredient: Faker::Number.unique.between(from: 1, to: numberIngredients), quantity: rand(100..300))
  end
  Faker::Number.unique.clear
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
  rand(1..3).times do |_|
    Recipe.create(id_item: item.id, id_ingredient: Faker::Number.unique.between(from: 1, to: numberIngredients), quantity: rand(100..300))
  end
  Faker::Number.unique.clear
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

# 10 platillos (categoría 'Food')
Item.create(name: 'Alitas de pollo', price: 119, category: 'Food', description: 'Alitas de pollo fritas y sazonadas con especias, acompañadas de salsa picante')
item.image.attach(io: File.open('app/assets/images/seed/alitas.png'), filename: 'alitas.png')

Item.create(name: 'Nachos', price: 149, category: 'Food', description: 'Tortilla chips con queso fundido, jalapeños, pico de gallo, frijoles y guacamole')
item.image.attach(io: File.open('app/assets/images/seed/nachos.png'), filename: 'nachos.png')

Item.create(name: 'Hamburguesa con queso', price: 159, category: 'Food', description: 'Hamburguesa de carne de res a la parrilla, queso fundido, lechuga, tomate y mayonesa')
item.image.attach(io: File.open('app/assets/images/seed/hamburguesa.png'), filename: 'hamburguesa.png')

Item.create(name: 'Sándwich de pollo', price: 139, category: 'Food', description: 'Pan de molde, pechuga de pollo empanizada, lechuga, tomate y mayonesa')
item.image.attach(io: File.open('app/assets/images/seed/sandwich.png'), filename: 'sandwich.png')

Item.create(name: 'Tacos de pescado', price: 179, category: 'Food', description: 'Tortillas de maíz rellenas de filete de pescado empanizado, col morada, cilantro y salsa picante')
item.image.attach(io: File.open('app/assets/images/seed/tacos.png'), filename: 'tacos.png')

Item.create(name: 'Pizza Margherita', price: 169, category: 'Food', description: 'Pizza con salsa de tomate, queso mozzarella y hojas de albahaca fresca')
item.image.attach(io: File.open('app/assets/images/seed/pizza.png'), filename: 'pizza.png')

Item.create(name: 'Ensalada César', price: 129, category: 'Food', description: 'Lechuga romana, pollo a la parrilla, crotones de pan, queso parmesano y aderezo César')
item.image.attach(io: File.open('app/assets/images/seed/ensalada.png'), filename: 'ensalada.png')

Item.create(name: 'Fish and Chips', price: 179, category: 'Food', description: 'Filete de pescado empanizado con papas fritas y salsa tártara')
item.image.attach(io: File.open('app/assets/images/seed/fish_chips.png'), filename: 'fish_chips.png')

# Drinks
Item.create(name: 'Coca-Cola', price: 39, category: 'Drink', description: 'Refresco de cola')
item.image.attach(io: File.open('app/assets/images/seed/coca_cola.png'), filename: 'coca_cola.png')

Item.create(name: 'Sprite', price: 39, category: 'Drink', description: 'Refresco de lima-limón')
item.image.attach(io: File.open('app/assets/images/seed/sprite.png'), filename: 'sprite.png')

Item.create(name: 'Agua', price: 29, category: 'Drink', description: 'Agua natural')
item.image.attach(io: File.open('app/assets/images/seed/agua.png'), filename: 'agua.png')

# Dessert
Item.create(name: 'Sundae', price: 39, category: 'Dessert', description: 'Helado de vainilla con salsa de caramelo')
item.image.attach(io: File.open('app/assets/images/seed/sundae.png'), filename: 'sundae.png')

Item.create(name: 'Pie de manzana', price: 49, category: 'Dessert', description: 'Pie de manzana caliente')
item.image.attach(io: File.open('app/assets/images/seed/pie.png'), filename: 'pie.png')

Item.create(name: 'McFlurry Oreo', price: 59, category: 'Dessert', description: 'Helado de vainilla con trozos de galleta Oreo')
item.image.attach(io: File.open('app/assets/images/seed/mcflurry.png'), filename: 'mcflurry.png')


# Ingredientes para las comidas
Ingredient.create(name: 'Carne de res', quant: 'grams', price: 0.12)
Ingredient.create(name: 'Queso americano', quant: 'grams', price: 0.08)
Ingredient.create(name: 'Aros de cebolla crujientes', quant: 'grams', price: 0.05)
Ingredient.create(name: 'Salsa BBQ', quant: 'ml', price: 0.02)
Ingredient.create(name: 'Pechuga de pollo', quant: 'grams', price: 0.10)
Ingredient.create(name: 'Tocino', quant: 'grams', price: 0.06)
Ingredient.create(name: 'Lechuga', quant: 'grams', price: 0.01)
Ingredient.create(name: 'Tomate', quant: 'grams', price: 0.02)
Ingredient.create(name: 'Pan de hamburguesa', quant: 'unidad', price: 0.20)
Ingredient.create(name: 'Salsa de tomate', quant: 'ml', price: 0.01)
Ingredient.create(name: 'Pasta', quant: 'grams', price: 0.05)
Ingredient.create(name: 'Salsa de queso', quant: 'ml', price: 0.03)
Ingredient.create(name: 'Albahaca', quant: 'grams', price: 0.02)

# Ingredientes para las bebidas
Ingredient.create(name: 'Cerveza', quant: 'unidad', price: 1.50)
Ingredient.create(name: 'Tequila', quant: 'ml', price: 0.05)
Ingredient.create(name: 'Ron', quant: 'ml', price: 0.04)
Ingredient.create(name: 'Vodka', quant: 'ml', price: 0.04)
Ingredient.create(name: 'Triple sec', quant: 'ml', price: 0.03)
Ingredient.create(name: 'Jugo de limón', quant: 'ml', price: 0.01)
Ingredient.create(name: 'Jugo de arándanos', quant: 'ml', price: 0.02)
Ingredient.create(name: 'Tónica', quant: 'ml', price: 0.01)
Ingredient.create(name: 'Agua', quant: 'ml', price: 0.01)
Ingredient.create(name: 'Té negro', quant: 'grams', price: 0.03)
Ingredient.create(name: 'Jarabe natural', quant: 'ml', price: 0.02)
Ingredient.create(name: 'Jugo de naranja', quant: 'ml', price: 0.02)
Ingredient.create(name: 'Refresco de cola', quant: 'ml', price: 0.01)
Ingredient.create(name: 'Hielo', quant: 'grams', price: 0.01)

# Ingredientes para los postres
Ingredient.create(name: 'Helado de vainilla', quant: 'grams', price: 0.07)
Ingredient.create(name: 'Brownie', quant: 'unidad', price: 0.80)
Ingredient.create(name: 'Fresas', quant: 'grams', price: 0.03)
Ingredient.create(name: 'Chocolate derretido', quant: 'ml', price: 0.04)
Ingredient.create(name: 'Crema batida', quant: 'ml', price: 0.02)


totalDays.times do |i|
  rand(1..8).times do |_|
    order = Order.create(
      tables_id: rand(1..numberTables),
      status: 'paid',
      total: Faker::Number.between(from: 300, to: 1000),
      note: Faker::Food.description,
      created_at: (i + 1).days.ago
    )
    rand(1..4).times do |_|
      OrdersItem.create(order_id: order.id, item_id: rand(1..totalnumberitems),
                        quantity: Faker::Number.between(from: 1, to: 3))
    end
  end
end
