class KitchenController < ApplicationController
  helper_method :statusTextBtn
  helper_method :statuscolor
  helper_method :statusColorOverlay

  def index
    @ordersN = Order.
      select("
        orders.id as order_id, orders.status, orders.note,
        tables.name as table, tables.id as table_id, items.id as item_id,
        items.name as item,
        orders_items.quantity, orders_items.status_item, orders_items.id as orders_items_id").
      joins("
        JOIN orders_items ON orders.id = orders_items.order_id
        JOIN tables ON orders.tables_id = tables.id
        JOIN items ON orders_items.item_id = items.id")

  end



  def update_status
    order = Order.find(params[:id])
    if order.status == 'wait'
      order.update(status: 'progress')
    elsif order.status == 'progress'
      order.update(status: 'done')
      finished(order)
    elsif order.status == 'done'
      order.update(status: 'closed')
    end
    redirect_to kitchen_index_path
  end

  def finished(order)
    orderitems = OrdersItem.where(orders_id: order)
    orderitems.update_all(status_item: true)
  end

  def whoops
    order = Order.find(params[:id])
    order.update(status: 'progress')
    redirect_to kitchen_index_path
  end


  def update_status_item
    orderitems = OrdersItem.find(params[:id])
    if orderitems.status_item == false
      orderitems.update(status_item: true)
    elsif orderitems.status_item == true
      orderitems.update(status_item: false)
    end
    redirect_to kitchen_index_path
  end



  def statuscolor(status)
    if status == 'wait'
      'status_waiting'
    elsif status == 'progress'
      'status_progress'
    elsif status == 'done'
      'status_done'
    end
  end


  def statusColorOverlay(status)
    if status == 'wait'
      'status_waiting_overlay'
    elsif status == 'progress'
      'status_progress_overlay'
    elsif status == 'done'
      'status_done_overlay'
    end
  end

  def statusTextBtn(status)
    if status == 'wait'
      'Mark as working'
    elsif status == 'progress'
      'Mark as Done'
    elsif status == 'done'
      'Close'
    end
  end

end
