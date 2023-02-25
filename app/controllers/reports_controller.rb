class ReportsController < ApplicationController
  def index
    if params[:start_date].present?
      @start_date = Date.parse(params[:start_date])
    else
      @start_date = Date.today
    end
    @data = Item.where("created_at >= ?", @start_date.beginning_of_day).where("created_at <= ?", @start_date.end_of_day).group_by_day(:created_at).count
  end
  

  def generate
  end

  def new
  end

  def create
  end

  def show
  end

  def update
  end

  def destroy
  end

  def edit
  end
end
