# frozen_string_literal: true

class OrdersController < ApplicationController
  def index
    @products = Product.where(id: session[:order_array])
  end

  def list
    session[:order_array] = Array.new if session[:order_array].nil?
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

  def create
    @order= Order.create(user_id: current_user.id)
    session[:order_array].each do |order|
    @order_items= @order.order_items.create(product_id: order, quantity: session[order])
    end
    if @order.update(total_price: 0)
    flash[:success] = t('create.success', param: 'Order')
    session[:order_array] =[]
    end
    redirect_to user_route_path
  end

  def download
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: { page_size: 'A4' }
      end
    end
  end

  private

  def update_product(product)
    qty = product.quantity - current_order.order_items.product_quantity(product.id)
    sold_qty = product.sold_quantity + current_order.order_items.product_quantity(product.id)
    product.update(quantity: qty, sold_quantity: sold_qty)
  end
end
