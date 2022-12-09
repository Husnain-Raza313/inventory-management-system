class OrderItemsController < ApplicationController
  def create
  end

  def update
    @order = current_order
  end

  def destroy
  end

  private

  def order_params
  end
  def set_order
  end

end
