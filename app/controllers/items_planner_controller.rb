class ItemsPlannerController < ApplicationController
  before_action :authenticate_user!

  def index
    @ingredients = Ingredient.all
  end
end
