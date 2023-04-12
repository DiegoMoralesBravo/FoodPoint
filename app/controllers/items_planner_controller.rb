class ItemsPlannerController < ApplicationController
  def index
    @ingredients = Ingredient.all
    @items = Item.all
  end
end
