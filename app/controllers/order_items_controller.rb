# frozen_string_literal: true

class OrderItemsController < ApplicationController
  def create
    session[:order_array], session[:order_quantity][params[:product_id]], message, type = OrderItemService.new(order_params: params,
                                                                                              session: session).execute
    set_flash_message(type, message)
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

    set_flash_message(type, message)
    redirect_to orders_path(status: 'order-list')
  end

  private

  def set_flash_message(type, msg)
    flash[type] = msg
  end
end
