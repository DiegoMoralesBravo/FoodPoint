class OrdersController < ApplicationController
  def index
    @items = Item.all
    @category = params[:category]
    @input = params[:name]
    if @input
      @products = Item.where('name ILIKE ?', "%#{@input}%")
      @order = Order.count
      # render json: @products
    elsif @category.present?
      @products = Item.where('category ILIKE ?', "%#{@category}%")
      @order = Order.count
    else
      @products = Item.all
      @order = Order.count
    end
  end
end
