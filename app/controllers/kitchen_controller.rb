class KitchenController < ApplicationController
  helper_method :statusColorBtn
  helper_method :statusColorCard
  helper_method :statusText
  helper_method :update_status
  helper_method :getItemName
  helper_method :getTableName

  def index
    @tables = Table.all
    @items = Item.all
    @orders  = Order.all
    @orderItems = OrdersItem.all
    @ordersN = Order.
      select("orders.id as order_id, orders.status, tables.name as table, items.id as item_id, items.name as item, orders_items.quantity, orders.note")
    .joins("JOIN orders_items ON orders.id = orders_items.orders_id JOIN tables ON orders.tables_id = tables.id JOIN items ON orders_items.items_id = items.id")



  end

  def update_status
    if order.status == 'wait'
      order.update(status: 'progress')
    elsif order.status == 'progress'
      order.update(status: 'done')
    elsif order.status == 'done'
      order.update(status: 'wait')
    end
    redirect_to kitchen_index_path
  end

  def statusColorBtn(order)
    if order.status == 'wait'
      'Mark as working'
    elsif order.status == 'progress'
      'Mark as Done'
    elsif order.status == 'done'
      'Delete'
    end
  end

  def statusColorCard(order)
    if order.status == 'wait'
      'kitchen__order__wait'
    elsif order.status == 'progress'
      'kitchen__order__progress'
    elsif order.status == 'done'
      'kitchen__order__done'
    end
  end

  def statusText(order)
    if order.status == 'wait'
      'kitchen__order__button__progress'
    elsif order.status == 'progress'
      'kitchen__order__button__done'
    elsif order.status == 'done'
      'kitchen__order__button__delete'
    end
  end

  def getItemName(item, orderitem, orderl)
    orderlist = []
    if orderitem.orders_id == orderl.id && item.id == orderitem.items_id
      orderitem.quantity == 1 ? "- #{item.name}" : "- #{item.name} x#{orderitem.quantity}"
    end
  end

  def getTableName(table, orderl)
    table.name if orderl.tables_id == table.id
  end

  def order_params
    params.require(:order).permit(:id, :status)
  end

  def order
    Order.find(params[:id])
  end

end
