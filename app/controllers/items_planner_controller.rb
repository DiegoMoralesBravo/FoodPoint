class ItemsPlannerController < ApplicationController
  before_action :authenticate_user!

  def index
    @items = Item.order(id: :asc).all
    months = 2
    @orders = OrdersItem.where(created_at: months.months.ago..Time.now).order(item_id: :asc).all
    lastId = @orders[0].item_id
    totalorders = 0

    @orders.each do |order|
      if order.item_id == lastId
        totalorders += order.quantity
      else
        bSearch(@items, lastId, 0, @items.length, totalorders / (months * 30))
        totalorders = 0
      end
      lastId = order.item_id
    end

  end

  def bSearch(list, target, bot, top, total)
    false if bot > top
    mid = (bot + top) / 2

    if list[mid].id == target
      list[mid].average = total
      true
    elsif target > list[mid].id
      bSearch(list, target, mid, top, total)
    else
      bSearch(list, target, bot, mid, total)
    end
    
  end
end
