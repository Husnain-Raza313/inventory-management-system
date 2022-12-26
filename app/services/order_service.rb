# frozen_string_literal: true

class OrderService < ApplicationService
  attr_reader :order_array, :order_quantity, :total_order_price, :order

  def initialize(**args)
    super
    @order_array = params[:session][:order_array]
    @total_order_price = params[:session][:total_order_price]
    @order_quantity = params[:session][:order_quantity]
    @order = params[:order]
  end

  def execute
    create_order_item
  end

  private

  def create_order_item
    type = 'success'
    order_array.each do |order_id|
      order_item = order.order_items.new(product_id: order_id, quantity: order_quantity[order_id.to_s])
      next if order_item.save

      message = order_item.errors.full_messages
      type = 'error'
      return [message, type]
    end

    update_order
  end

  def update_order
    if order.update(total_price: total_order_price)
      message = nil
      type = nil
    else
      message = @order.errors.full_messages
      type = 'error'
    end
    [message, type]
  end
end
