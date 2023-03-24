class OrdersController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @items = Item.all
    @tables = Table.all
    @orders = Order.all
    @category = params[:category]
    @input = params[:name]
    @order = (Order.count + 1) unless (@order = params[:order])

    @products = if @input
                  Item.where('name ILIKE ?', "%#{@input}%")
                elsif @category.present?
                  Item.where('category ILIKE ?', "%#{@category}%")
                else
                  Item.all
                end
  end

  def create
    items = params[:order]
    total = params[:total]
    note = params[:note]
    mesa = params[:selected_table_id]
    number_order = params[:numberOrder]

    unless number_order
      newOrder = Order.create(
        tables_id: mesa,
        status: 'wait',
        total: total,
        note: note
      )
      number_order = newOrder.id
    end

    items.each do |item|
      id = Item.find_by(name: item[:name]).id
      OrdersItem.create(orders_id: number_order, items_id: id, quantity: item[:quantity])
    end
  end
end
