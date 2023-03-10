class OrdersController < ApplicationController

  def index
    @items = Item.all
    @order = Order.count
  end

end
