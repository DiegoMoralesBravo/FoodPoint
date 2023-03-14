class OrdersController < ApplicationController
  def index
    @items = Item.all

    @input = params[:name]
    if @input
      @products = Item.where('name ILIKE ?', "%#{@input}%")
      @order = Order.count
      # render json: @products
    else
      @products = Item.all
      @order = Order.count
    end
  end
end
