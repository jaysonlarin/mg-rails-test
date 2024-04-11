class BasketCaseController < ApplicationController
  before_action :set_fruits
  before_action :set_items
  before_action :set_order

  def index; end

  def order_by_fruit
    @list_items = @list_items.sort
    reverse_and_render
  end

  def order_by_amount
    @list_items = @list_items.sort_by(&:last)
    reverse_and_render
  end

  def reverse_and_render
    @list_items = @list_items.reverse if params.has_key?(:order) && params[:order] == "desc"

    render 'basket_case/index'
  end

  private
    def set_fruits
      @fruits = {
        oranges: 5,
        apples: 9,
        grapes: 3,
        watermelons: 2,
        guavas: 4
      }
    end

    def set_items
      @list_items = @fruits
    end

    def set_order
      return @order = 'desc' unless params.has_key?(:order)
      @order = params[:order] == 'desc' ? 'asc' : 'desc'
    end
end
