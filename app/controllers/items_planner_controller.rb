class ItemsPlannerController < ApplicationController
  before_action :authenticate_user!

  def index
    @ingredients = Ingredient.all

    @items = OrdersItem.where(created_at: 1.months.ago..Time.now).order(item_id: :asc).all
    lastId = nil
    totalItems = 0
    @items.each do |item|
      if item.item_id == lastId || lastId.nil?
        totalItems += item.quantity
      else
        puts item.item_id
        puts totalItems
        totalItems = 0
      end
      lastId = item.item_id
    end
  end
end
