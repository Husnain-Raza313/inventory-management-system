# frozen_string_literal: true

class OrdersController < ApplicationController
  def index
    if params[:status] == 'order-list'
      @products = Product.ordered_products(session[:order_array])
    else
      session[:order_array] = [] if session[:order_array].blank?
      @products = Product.available_products
      render 'list' and return
    end
  end

  def create
    @order = Order.create(user_id: current_user.id)
    session[:order_array].each do |order|
      @order_items = @order.order_items.create(product_id: order, quantity: session[order])
    end
    if @order.update(total_price: session[:total_order_price])
      flash[:success] = t('create.success', param: 'Order')
      session[:order_array] = []
    else
      flash[:error] = @order.errors.full_messages
    end
    redirect_to user_route_path
  end

  def pdf
    @products = Product.ordered_products(session[:order_array])
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: { page_size: 'A4' }
      end
    end
  end
end
