class OrderController < ApplicationController
  def index
    @products = Product.all
    @order_items = current_order.order_items.new
  end
  def show
    @order_items = current_order.order_items
  end
end
