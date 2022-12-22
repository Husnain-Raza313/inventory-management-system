# frozen_string_literal: true

class OrderItemsController < ApplicationController
  def create
    session[:order_array], session[:order_quantity][params[:product_id]], message, type = OrderItemService.new(order_params: params,
                                                                                                               session: session).execute
    flash[type] = message
    redirect_back(fallback_location: root_path)
  end

  def destroy
    if session[:order_array].delete(params[:id])
      message = t('destroy.success', param: 'Order Item')
      type = 'success'
    else
      message = t('error-message')
      type = 'error'
    end

    flash[type] = message
    redirect_to orders_path(status: 'order-list')
  end
end
