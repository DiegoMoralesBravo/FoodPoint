class OrdersController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @items = Item.all
    @category = params[:category]
    @input = params[:name]
    @products = if @input
                  Item.where('name ILIKE ?', "%#{@input}%")
                # render json: @products
                elsif @category.present?
                  Item.where('category ILIKE ?', "%#{@category}%")
                else
                  Item.all
                end
    @order = Order.count
  end

  def create
    newOrder = params[:_json]
    puts @order
    newOrder.each do |item|
      OrdersItem.create(orders_id: 1, items_id: 1, quantity: 1)
      # if @order.save
      #   puts 'GUARDADO'
      # else
      #   putes 'NO GUARDADO'
      # end
    end
  end
end
