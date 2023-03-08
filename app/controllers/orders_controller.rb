class OrdersController < ApplicationController

  def index
    @items = Item.all
  end

end
