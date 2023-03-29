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
    when "14_days"
      @end_date = @start_date.advance(days: -13)
      @previous_start_date = @start_date.advance(days: -27)
      @previous_end_date = @start_date.advance(days: -14)
    when "1_month"
      @end_date = @start_date.advance(months: -1)
      @previous_start_date = @start_date.advance(months: -2)
      @previous_end_date = @start_date.advance(months: -1)
    else
      @end_date = @start_date
      @previous_end_date = @start_date.advance(days: -1)
      @previous_start_date = @start_date.advance(days: -2)
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
                      .sum
    
    @previous_max_order = Order.where("created_at >= ?", @previous_end_date.beginning_of_day)
                              .where("created_at <= ?", @previous_start_date.end_of_day)
                              .group_by_day(:created_at)
                              .maximum(:total)
                              .values
                              .sum
    
  end
end