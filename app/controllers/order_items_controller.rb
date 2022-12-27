# frozen_string_literal: true

class OrderItemsController < ApplicationController
  def create
    session[:order_array], session[:order_quantity][params[:product_id]], @message, @type = OrderItemService.new(order_params: params,
                                                                                                                 session: session).execute
    return unless params[:request] != 'create'

    set_products
    render 'update.js.erb'
  end

  def destroy
    if session[:order_array].delete(params[:id])
      @message = t('destroy.success', param: 'Order Item')
      @type = 'success'
    else
      @message = t('error-message')
      @type = 'error'
    end

    set_products
  end

  private

  def set_products
    @products = Product.ordered_session_products(session[:order_array])
  end
end
