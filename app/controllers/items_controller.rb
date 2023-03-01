class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to '/items'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def update
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
    params.require(:item).permit(:name, :price, :category, :image)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
