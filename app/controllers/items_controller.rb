class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.order("id ASC").all
  end

  def new
    @ingredients = Ingredient.all
    @item = Item.new
  end

  def create
    @params = item_params
    @item = Item.new(@params.except('recipe'))
    if @item.save
      JSON.parse(@params[:recipe]).each do |ingredient|
        Recipe.create(id_item: @item.id, id_ingredient: ingredient['id'], quantity: ingredient['value'])
      end
      redirect_to '/items'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def update
    @ingredients = Ingredient.all
    if @item.update(item_params)
      redirect_to '/items'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    redirect_to items_path, status: :see_other
  end

  def edit
  end

  private
  def item_params
    params.require(:item).permit(:name, :price, :category, :image, :recipe)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
