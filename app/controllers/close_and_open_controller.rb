class CloseAndOpenController < ApplicationController

  helper_method :update_status

  def index
    @tables = Table.all
    @orders = Order.all.where(created_at: Time.now.all_day)
    @orderitems = OrdersItem.all

    if params[:tables_id]
      @orders = @orders.where(tables_id: params[:tables_id])
    end

    if params[:order_id].present?
      @order = params[:order_id]
      @order_Items = OrdersItem.where(order_id: @order)
    else
      @order = 'Select'
    end

    if params[:order_status].present?
      @status = params[:order_status]
    else
      @status = 'Select'
    end

    if params[:order_tables_id].present?
      @tables = params[:order_tables_id]
    else
      @tables = 'Select'
    end

    if params[:order_total].present?
      @total = params[:order_total]
    else
      @total = 'Select'
    end

    if params[:orderitem_quantity].present?
      @quantity = params[:orderitem_quantity]
    else
      @quantity = 'Select'
    end

    @total_val = Order.where(status: "paid", created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day).sum(:total)
  end

  def destroy
    @order = Order.find_by_id(params[:id])
    @order.destroy
    redirect_to close_and_open_path
  end

  def update_status
    if order.status == 'wait'
      order.update(status: 'paid')
    elsif order.status == 'progress'
      order.update(status: 'paid')
    elsif order.status == 'done'
      order.update(status: 'paid')
    end
    redirect_to close_and_open_index_path
  end

  def order
    Order.find(params[:id])
  end

end
