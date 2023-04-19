class ItemsPlannerController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token
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
        bSearch(@items, lastId, 0, @items.length, totalorders)
        totalorders = 0
      end
      lastId = order.item_id
    end



    @items.each do |item|
      recipes = Recipe.where(id_item: item.id).all
      min = 9999
      recipes.each do |recipe|
        ingredients = Ingredient.find(recipe.id_ingredient)
        available =  ingredients.total / recipe.quantity
        if available < min
          min = available
        end
      end
      item.available_qty = min
    end
  end

  def getIngredients
    item_id = params[:item_id]
    ingredients = Recipe.where(id_item: item_id).all
    render json: ingredients
  end

  def bSearch(list, target, bot, top, total)
    false if bot > top
    mid = (bot + top) / 2

    if list[mid].id == target
      list[mid].average = (total * 0.25).ceil
      list[mid].sales = total
      true
    elsif target > list[mid].id
      bSearch(list, target, mid + 1, top, total)
    else
      bSearch(list, target, bot, mid - 1, total)
    end
  end
end
