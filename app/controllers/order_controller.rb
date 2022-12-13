# frozen_string_literal: true

class OrderController < ApplicationController
  def index
    @order_items = current_order.order_items.new
    @product_ids = current_order.order_items.pluck(:product_id)
    @products = Product.all
  end

  def show
    @order_items = current_order.order_items
  end
end
