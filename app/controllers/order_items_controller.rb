# frozen_string_literal: true

class OrderItemsController < ApplicationController
  before_action :set_order

  def create
    @order_item = @order.order_items.new(order_params)
    flash[:error] = @order.errors.full_messages.to_sentence unless @order.save

    session[:order_id] = @order.id
    render json: { message: 'Successfully created order_item' }
  end

  def update
    @order_item = @order.order_items.find(params[:id])
    if @order_item.update(order_params)
      flash[:success] = t('update.success', param: 'Order Item')
      @order_items = current_order.order_items
    else
      flash[:warning] = @product.errors.full_messages.to_sentence
    end

    redirect_to order_path
  end

  def destroy
    @order_item = @order.order_items.find(params[:id])
    if @order_item.destroy
      flash[:success] = t('destroy.success', param: 'Order Item')
      @order_items = current_order.order_items
    else
      flash[:error] = @product.errors.full_messages.to_sentence
    end

    redirect_to order_path
  end

  private

  def order_params
    params.require(:order_item).permit(:product_id, :quantity, :user_id)
  end

  def set_order
    @order = current_order
  end
end
