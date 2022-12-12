class OrderItemsController < ApplicationController
  before_action :set_order

  def create
    user = current_user
    @order_item = @order.order_items.new(order_params)
    p "jsk#{@order_item.quantity}"
    p @order.user_id
    unless @order.save
      p "jsk #{@order.errors.full_messages.to_sentence}"
    end
    session[:order_id] = @order.id
  end

  def update
    @order_item = @order.order_items.find(params[:id])
    @order_item.update(order_params)
    @order_items = current_order.order_items
    redirect_to order_path
  end

  def destroy
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = current_order.order_items
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
