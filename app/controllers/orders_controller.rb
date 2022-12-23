# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :set_session, only: %i[index]

  def index
    index_list
  end

  def create
    @order = Order.new(user_id: current_user.id)
    if @order.save
      message, type = OrderService.new(session: session, order: @order).execute
      set_session(true)
    else
      message = @order.errors.full_messages
      type = 'error'
    end
    flash[type] = message
    redirect_to preview_orders_path(type: 'preview')
  end

  def pdf
    @order = Order.last
    @products = Product.ordered_products(@order.order_items)

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: { page_size: 'A4' }
      end
    end
  end

  private

  def set_session(flag = false)
    return unless session[:order_array].blank? || flag

    session[:order_array] = []
    session[:order_quantity] = HashWithIndifferentAccess.new
  end

  def index_list
    if params[:status] == 'order-list'
      @products = Product.ordered_products(session[:order_array])
    elsif params[:brand_ids].present? || params[:category_ids].present?
      @products = get_all_products
      @products = ProductService.new(category_ids: params[:category_ids], brand_ids: params[:brand_ids],
                                     products: @products).filter
      render 'list' and return
    else
      @products = get_all_products
      render 'list' and return
    end
  end

  def get_all_products
    Product.paginate(page: params[:page], per_page: 10).available_products
  end
end
