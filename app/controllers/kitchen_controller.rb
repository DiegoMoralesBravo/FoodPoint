class KitchenController < ApplicationController
  helper_method :itemsPerOrder
  def index
    @tables = Table.all
    @items = Item.all
    @order  = Order.all
    @orderItems = OrdersItem.all
  end

  def itemsPerOrder
    
  end

  def new
  end

  def create
  end

  def show
  end

  def update
  end

  def destroy
  end

  def edit
  end

end
