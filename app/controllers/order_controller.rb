# frozen_string_literal: true

class OrderController < ApplicationController
  def index
    @order_items = current_order.order_items.new
    @product_ids = current_order.order_items.product_ids
    @products = Product.where(available: true).all
  end

  def show
    @order_items = current_order.order_items
  end
end
