# frozen_string_literal: true

class OrdersController < ApplicationController
  def index
    @order_items = current_order.order_items
  end

  def list
    @order_items = current_order.order_items.new
    @product_ids = current_order.order_items.product_ids
    @products = Product.available_products
  end
end
