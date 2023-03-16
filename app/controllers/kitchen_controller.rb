class KitchenController < ApplicationController
  helper_method :update_status
  helper_method :statusTextBtn

  def index
    @ordersN = Order.
      select("
        orders.id as order_id, orders.status, orders.note,
        tables.name as table, items.id as item_id,
        items.name as item, orders_items.quantity").
      joins("
        JOIN orders_items ON orders.id = orders_items.orders_id
        JOIN tables ON orders.tables_id = tables.id
        JOIN items ON orders_items.items_id = items.id")
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

  def statusTextBtn(order)
    if order.status == 'wait'
      'Mark as working'
    elsif order.status == 'progress'
      'Mark as Done'
    elsif order.status == 'done'
      'Delete'
    end
  end

end
