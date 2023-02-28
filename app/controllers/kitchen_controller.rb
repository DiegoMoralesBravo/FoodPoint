class KitchenController < ApplicationController
  helper_method :itemsPerOrder
  def index
    @tables = Table.all
    @items = Item.all
    @order  = Order.all
    @orderItems = OrdersItem.all
  end

  def update
    if order.status == 'wait'
      order.update(status: 'progress')
    elsif order.status == 'progress'
      order.update(status: 'done')
    elsif order.status == 'done'
      order.update(status: 'wait')
    end
    redirect_to order_path
  end

  def destroy
    
  end

  private 

  def order_params
    params.require(:order).permit(:id, :status)
  end

  def order
    @individualOrder = Order.find(params[:id])
  end


end
