# frozen_string_literal: true

class OrderItemsController < ApplicationController
  def create
    session[:order_array].append(params[:product_id])
    session[params[:product_id]] = params[:quantity].to_i
    render json: { message: 'Successfully created order_item' }
  end

  def update
    session[params[:product_id]] = params[:quantity].to_i
    if session[params[:product_id]].nil?
      flash[:error] = t('error-message')
    else
      set_order_item('destroy')
    end

    redirect_to orders_path
  end

  def destroy
    if session[:order_array].delete(params[:id])
      set_order_item('destroy')
    else
      flash[:error] = t('error-message')
    end

    redirect_to orders_path
  end

  private

  def set_order_item(_action)
    flash[:success] = t("#{_action}.success", param: 'Order Item')
  end
end
