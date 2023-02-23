class TablesController < ApplicationController

  before_action :set_table, only: [:show, :edit, :update, :destroy]

  def index
    @tables = Table.all
  end

  def new
    @table = Table.new
  end

  def create
    @table = Table.new(table_params)
    if @table.save
      redirect_to '/tables'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def update
    if @table.update(table_params)
      redirect_to '/tables'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @table.destroy
    redirect_to tables_path, status: :see_other
  end

  def edit
  end

  private
  def table_params
    params.require(:table).permit(:name, :size)
  end

  def set_table
    @table = Table.find(params[:id])
  end
end
