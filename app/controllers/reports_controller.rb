class ReportsController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:start_date].present?
      @start_date = Date.parse(params[:start_date])
    else
      @start_date = Date.today
    end

    

    case params[:period]
    when "7_days"
      @end_date = @start_date.advance(days: -6)
      @previous_start_date = @start_date.advance(days: -13)
      @previous_end_date = @start_date.advance(days: -7)

      @previous_total = Order.where("created_at >= ?", @previous_start_date.beginning_of_day)
                            .where("created_at <= ?", @previous_end_date.end_of_day)
                            .group_by_day(:created_at)
                            .sum(:total)
                            .values
                            .sum

      @previous_orders = Order.where("created_at >= ?", @previous_start_date.beginning_of_day)
                              .where("created_at <= ?", @previous_end_date.end_of_day)
                              .group_by_day(:created_at)
                              .count
                              .values
                              .sum
      @previous_data = Order.where("created_at >= ?", @previous_start_date.beginning_of_day)
                              .where("created_at <= ?", @previous_end_date.end_of_day)
                              .group(:id)
                              .sum(:total)
      @text = "Last 7 days"
    when "14_days"
      @end_date = @start_date.advance(days: -13)
      @previous_start_date = @start_date.advance(days: -27)
      @previous_end_date = @start_date.advance(days: -14)

      @previous_total = Order.where("created_at >= ?", @previous_start_date.beginning_of_day)
                            .where("created_at <= ?", @previous_end_date.end_of_day)
                            .group_by_day(:created_at)
                            .sum(:total)
                            .values
                            .sum

      @previous_orders = Order.where("created_at >= ?", @previous_start_date.beginning_of_day)
                            .where("created_at <= ?", @previous_end_date.end_of_day)
                            .group_by_day(:created_at)
                            .count
                            .values
                            .sum

      @previous_data = Order.where("created_at >= ?", @previous_start_date.beginning_of_day)
                            .where("created_at <= ?", @previous_end_date.end_of_day)
                            .group(:id)
                            .sum(:total)
      @text = "Last 14 days"
    when "1_month"
      @end_date = @start_date.advance(months: -1)
      @previous_start_date = @start_date.advance(months: -2)
      @previous_end_date = @start_date.advance(months: -1)

      @previous_total = Order.where("created_at >= ?", @previous_start_date.beginning_of_day)
                            .where("created_at <= ?", @previous_end_date.end_of_day)
                            .group_by_day(:created_at)
                            .sum(:total)
                            .values
                            .sum

    @previous_orders = Order.where("created_at >= ?", @previous_start_date.beginning_of_day)
                            .where("created_at <= ?", @previous_end_date.end_of_day)
                            .group_by_day(:created_at)
                            .count
                            .values
                            .sum
    
    @previous_data = Order.where("created_at >= ?", @previous_start_date.beginning_of_day)
                            .where("created_at <= ?", @previous_end_date.end_of_day)
                            .group(:id)
                            .sum(:total)
    @text = "Last month"
    else
      @end_date = @start_date
      @previous_start_date = @start_date.advance(days: -2)
      @previous_end_date = @start_date.advance(days: -1)

      @previous_total = Order.where("created_at >= ?", @previous_end_date.beginning_of_day)
                            .where("created_at <= ?", @previous_end_date.end_of_day)
                            .group_by_day(:created_at)
                            .sum(:total)
                            .values
                            .sum
      @previous_orders = Order.where("created_at >= ?", @previous_start_date.beginning_of_day)
                            .where("created_at <= ?", @previous_start_date.end_of_day)
                            .group_by_day(:created_at)
                            .count
                            .values
                            .sum
      @previous_data = Order.where("created_at >= ?", @previous_end_date.beginning_of_day)
                            .where("created_at <= ?", @previous_end_date.end_of_day)
                            .group(:id)
                            .sum(:total)
      @text = @previous_end_date.strftime('%A, %b %d')
    end
    
    @data = Order.where("created_at >= ?", @end_date.beginning_of_day)
                 .where("created_at <= ?", @start_date.end_of_day)
                 .group(:id)
                 .sum(:total)

    @total = Order.where("created_at >= ?", @end_date.beginning_of_day)
                  .where("created_at <= ?", @start_date.end_of_day)
                  .group_by_day(:created_at)
                  .sum(:total)
                  .values
                  .sum
    
    @orders = Order.where("created_at >= ?", @end_date.beginning_of_day)
                   .where("created_at <= ?", @start_date.end_of_day)
                   .group_by_day(:created_at)
                   .count
                   .values
                   .sum
    
    @max_order = Order.where("created_at >= ?", @end_date.beginning_of_day)
                      .where("created_at <= ?", @start_date.end_of_day)
                      .group_by_day(:created_at)
                      .maximum(:total)
                      .values
                      .max
    
    @previous_max_order = Order.where("created_at >= ?", @previous_end_date.beginning_of_day)
                              .where("created_at <= ?", @previous_end_date.end_of_day)
                              .group_by_day(:created_at)
                              .maximum(:total)
                              .values
                              .max

    
    @item_ids = OrdersItem.select("items_id, SUM(quantity) AS quantity")
                              .where("created_at >= ?", @end_date.beginning_of_day)
                              .where("created_at <= ?", @start_date.end_of_day)
                              .group(:items_id, :quantity)
                              .order('quantity DESC')
                              .pluck(:items_id)
                          
  end
end
