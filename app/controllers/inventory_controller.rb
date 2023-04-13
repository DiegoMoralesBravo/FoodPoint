class InventoryController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

  def index
    @ingredients = Ingredient.all.order("id ASC")
  end

  def create
    id = params[:ingredient]
    total = params[:total]

    ingredient = Ingredient.find(id)
    ingredient.total = total
    ingredient.save
  end
end
