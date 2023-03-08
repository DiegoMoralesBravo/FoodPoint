class CloseAndOpenController < ApplicationController

  def index
    @orders  = Order.all
    @orderItems = OrdersItem.all
  end

  def order
    Order.find(params[:id])
  end

end
