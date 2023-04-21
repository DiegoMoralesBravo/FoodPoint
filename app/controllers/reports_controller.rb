class ReportsController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:period].present?
      @days = params[:period].to_i
    else
      @days = 1
    end

    @previous_total = Order.where(created_at: (@days * 2).days.ago.beginning_of_day..@days .days.ago.end_of_day)
                          .group_by_day(:created_at)
                          .sum(:total)
                          .values
                          .sum

    @previous_orders = Order.where(created_at: (@days * 2).days.ago.beginning_of_day...@days.days.ago.end_of_day)
                            .group_by_day(:created_at)
                            .count
                            .values
                            .sum
    
    @previous_data = Order.where(created_at: (@days * 2).days.ago.beginning_of_day...@days.days.ago.end_of_day)
                            .group(Arel.sql("date_trunc('hour', created_at)"))
                            .order(Arel.sql("date_trunc('hour', created_at)"))
                            .sum(:total).to_a

    @data = Order.where(created_at: @days.days.ago.beginning_of_day..Time.now)
                  .group(Arel.sql("date_trunc('hour', created_at)"))
                  .order(Arel.sql("date_trunc('hour', created_at)"))
                  .sum(:total).to_a

    @total = Order.where(created_at: @days.days.ago.beginning_of_day..Time.now)
                  .group_by_day(:created_at)
                  .sum(:total)
                  .values
                  .sum
    
    @orders = Order.where(created_at: @days.days.ago.beginning_of_day..Time.now)
                   .group_by_day(:created_at)
                   .count
                   .values
                   .sum
    
    @max_order = Order.where(created_at: @days.days.ago.beginning_of_day..Time.now)
                      .group_by_day(:created_at)
                      .maximum(:total)
                      .values
                      .max
                      .to_i
    
    @previous_max_order = Order.where(created_at: (@days * 2).days.ago.beginning_of_day...@days.days.ago.end_of_day)
                              .group_by_day(:created_at)
                              .maximum(:total)
                              .values
                              .max
                              .to_i

    @table_info_orders = Order.where(created_at: @days.days.ago.beginning_of_day..Time.now).all

    index = 0
    @data.each do |data|
      @previous_data[index][0] = data[0]
      index += 1
    end

    @sales = OrdersItem.where("created_at >= ?", @days.days.ago.beginning_of_day)
                   .group(:item_id)
                   .sum(:quantity)
                   .first(10)
                   .to_a

    @sales.each do |data|
      data[2] = data[0]
      item = Item.find(data[0])
      data[0] = item.name
      data[3] = item.price
    end
    @sales = @sales.sort_by { |data| data[1] }.reverse
  end
end
