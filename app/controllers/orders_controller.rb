# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :set_session, only: %i[index]

  def index
    index_list
  end

  def create
    @order = Order.create(user_id: current_user.id)
    create_order_items
    if @order.update(total_price: session[:total_order_price])
      flash[:success] = t('create.success', param: 'Order')
      session[:order_array] = []
      session[:order_quantity] = Hash.new
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

  private

  def set_session
    if session[:order_array].blank?
      session[:order_array] = []
      session[:order_quantity] = Hash.new
    end
  end

  def create_order_items
    session[:order_array].each do |order|
      @order_items = @order.order_items.create(product_id: order, quantity: order_item_quantity(order))
    end
  end

  def index_list
    if params[:status] == 'order-list'
      @products = Product.ordered_products(session[:order_array])
    else
      @products = Product.available_products
      render 'list' and return
    end
  end
end
