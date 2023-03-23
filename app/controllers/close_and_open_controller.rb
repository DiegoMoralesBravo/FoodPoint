class CloseAndOpenController < ApplicationController

  def index
    @tables = Table.all
    @orders = Order.all

    if params[:tables_id]
      @orders = @orders.where(tables_id: params[:tables_id])
    end
  end

  def order
    Order.find(params[:id])
  end
end
