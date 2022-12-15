# frozen_string_literal: true

class OrdersController < ApplicationController
  def index
    @products = Product.where(id: session[:order_array])
  end

  def list
    session[:order_array] = [] if session[:order_array].nil?
    @products = Product.available_products
  end

  def create
    @order = Order.create(user_id: current_user.id)
    session[:order_array].each do |order|
      @order_items = @order.order_items.create(product_id: order, quantity: session[order])
    end
    if @order.update(total_price: 0)
      flash[:success] = t('create.success', param: 'Order')
      session[:order_array] = []
    end
    redirect_to user_route_path
  end

  def download
    @products = Product.where(id: session[:order_array])
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: { page_size: 'A4' }
      end
    end
  end
end
