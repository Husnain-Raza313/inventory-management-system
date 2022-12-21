# frozen_string_literal: true

class OrderItemsController < ApplicationController

  def create
    session[:order_array], session[params[:product_id]], message, type = OrderItemService.new(args: params, session: session).execute
    set_flash_message(type, message)
    redirect_back(fallback_location: root_path)
  end

  # def update
  #   session[:order_array], session[params[:product_id]], message, type = OrderItemService.new(product_id: params[:product_id], quantity: params[:quantity].to_i, order_array: session[:order_array], product_quantity: session[params[:product_id]]).execute
  #   set_flash_message(type, message)
  #   redirect_to orders_path(status: 'order-list')
  # end

  def destroy
    if session[:order_array].delete(params[:id])
      message = t("destroy.success", param: 'Order Item')
      type= "success"
    else
      message = t('error-message')
      type= "error"
    end

    set_flash_message(type, message)
    redirect_to orders_path(status: 'order-list')
  end

  private

  def set_flash_message(type, msg)
    # err ? flash[:error] = msg : flash[:success] = msg
    flash[:"#{type}"] = msg
  end
  # def set_order_item
  #   session[:order_array], session[params[:product_id]] = OrderItemService.new(params[:status],params[:product_id],params[:quantity].to_i, session[:order_array], session[params[:product_id]], flash).execute
  #   if params[:status] == 'create'
  #     redirect_to user_route_path
  #   else
  #     redirect_to orders_path(status: 'order-list')
  #   end
  # end
  #   render json: { message: t("create.success", param: 'Order Item') } and return if params[:status] == 'create'
  #   redirect_to orders_path(status: 'order-list') and return
  # end

  # def create_order_item
  #   session[:order_array].append(params[:product_id])
  #   session[params[:product_id]] = params[:quantity].to_i
  #   render json: { message: t("create.success", param: 'Order Item') } and return
  # end

  # def update_order_item
  #   session[params[:product_id]] = params[:quantity].to_i
  #   if session[params[:product_id]].nil?
  #     flash[:error] = t('error-message')
  #   else
  #     flash[:success] = t("update.success", param: 'Order Item')
  #   end

  #   redirect_to orders_path(status: 'order-list') and return
  # end
end
