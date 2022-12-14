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

  def show
    @products= Product.ordered_products(current_order.order_items.product_ids)
    @products.each do |product|
      unless update_product(product)
        flash[:error] = product.errors.full_messages
        redirect_to orders_path
      end

    end
    session[:order_id] = nil
    flash[:success] = t('create.success', param: 'Order')
    redirect_to user_route_path
  end

  private

  def update_product(product)
    qty = product.quantity - current_order.order_items.product_quantity(product.id)
    sold_qty = product.sold_quantity + current_order.order_items.product_quantity(product.id)
    product.update(quantity: qty, sold_quantity: sold_qty)
  end
end
