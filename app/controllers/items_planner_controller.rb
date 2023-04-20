class ItemsPlannerController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token
  def index
    @items = Item.order(id: :asc).all
    @ingredients = Ingredient.order(id: :asc).all
    months = 2
    @orders = OrdersItem.where(created_at: months.months.ago..Time.now).order(item_id: :asc).all
    lastId = @orders[0].item_id
    totalorders = 0
    @ingSupplieList = []

    @orders.each do |order|
      if order.item_id == lastId
        totalorders += order.quantity
      else
        bSearch(@items, lastId, 0, @items.length, totalorders)
        totalorders = 0
      end
      lastId = order.item_id
    end
    bSearch(@items, lastId, 0, @items.length, totalorders)

    @items.each do |item|
      recipes = Recipe.where(id_item: item.id).all
      min = 9999
      recipes.each do |recipe|
        ingredients = Ingredient.find(recipe.id_ingredient)
        available =  ingredients.total / recipe.quantity
        if available < min
          min = available
        end
        if available < item.average
          requiredSupplie = (item.average - available) * recipe.quantity
          total = (requiredSupplie * ingredients.price)
          ingredient = { id: ingredients.id, name: ingredients.name, reqSupp: requiredSupplie, units: ingredients.quant, price: ingredients.price,
                         total: }
          ingredientRepeat = @ingSupplieList.find { |ing| ing[:id] == ingredient[:id] }
          if ingredientRepeat.present?
            ingredientRepeat[:reqSupp] += ingredient[:reqSupp]
            ingredientRepeat[:total] += ingredient[:total]
          else
            @ingSupplieList.push(ingredient)
          end
        end
      end
      item.available_qty = min
    end
    @ingSupplieList = @ingSupplieList.sort_by { |ingredient| ingredient[:id] }
  end

  def getIngredients
    item_id = params[:item_id]
    avg = params[:avg].to_i()
    ingredients = Recipe.where(id_item: item_id).all

    listIngredients = []
    ingredientObj = {}
    ingredients.each do |ingredient|
      ingName = Ingredient.find(ingredient.id_ingredient);
      available = ingName.total/ingredient.quantity;
      if(available < avg)
        status = "short"
      else
        status = "good"
      end
      ingredientObj = {name: ingName.name, current_qty: ingName.total, recipe_qty: ingredient.quantity, available: available, status: status}
      listIngredients.push(ingredientObj)

    end

    render json: listIngredients

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
