# frozen_string_literal: true

class OrderItemsController < ApplicationController

  def create
    session[:order_array].append(params[:product_id])
    session[params[:product_id]] = params[:quantity].to_i
    render json: { message: 'Successfully created order_item' }
  end

  def update
    session[params[:product_id]] = params[:quantity].to_i
    redirect_to orders_path
  end

  def destroy
    if session[:order_array].delete(params[:id])
      set_order_item('destroy')
    else
      flash[:error] =t('error-message')
    end

    redirect_to orders_path
  end

  private

  def order_params
    params.require(:order_item).permit(:product_id, :quantity, :user_id)
  end
  def set_order_item(_action)
    flash[:success] = t("#{_action}.success", param: 'Order Item')
  end
end
