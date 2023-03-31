class IngredientsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ingredient, only: %i[show edit update destroy]

  def index
    @ingredients = Ingredient.all
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      redirect_to '/ingredients'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show; end

  def update
    if @ingredient.update(ingredient_params)
      redirect_to ingredients_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @ingredient.destroy
    redirect_to ingredients_path, status: :see_other
  end

  def edit; end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name, :quant, :price, :current, :total)
  end

  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end
end
