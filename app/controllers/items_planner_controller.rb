class ItemsPlannerController < ApplicationController
  def index
    @ingredients = Ingredient.all
  end
end
