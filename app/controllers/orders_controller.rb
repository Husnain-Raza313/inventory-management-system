# frozen_string_literal: true

class OrdersController < ApplicationController
  def index
    @order_items = current_order.order_items
  end

  def list
    @order_items = current_order.order_items.new
    @product_ids = current_order.order_items.product_ids
    @products = Product.available_products
  end

  def show
    @products= Product.ordered_products(current_order.order_items.product_ids)
    @products.each do |product|
      unless update_product(product)
        flash[:error] = product.errors.full_messages
        redirect_to orders_path
      end

    end
    session[:order_id] = nil
    flash[:success] = t('create.success', param: 'Order')
    redirect_to user_route_path
  end

  def preview
    pdf = Prawn::Document.new
    pdf.text "Order ID: #{current_order.id}"
    pdf.text "Order Total: #{current_order.total_price}"
    pdf.text "ITEM DETAILS : "
    current_order.order_items.each do |item|
      pdf.text "Serial No: #{item.product.serial_no}"
      pdf.text "Name: #{item.product.name}"
      pdf.text "Quantity: #{item.quantity}"
      pdf.text "Retail Price: #{item.product.retail_price}"
      pdf.text "Total Price: #{item.total_price}"
    end
    send_data(pdf.render,
              filename: "#{current_order.id}",
              type: 'application/pdf',
              disposition: 'inline')

  end

  private

  def update_product(product)
    qty = product.quantity - current_order.order_items.product_quantity(product.id)
    sold_qty = product.sold_quantity + current_order.order_items.product_quantity(product.id)
    product.update(quantity: qty, sold_quantity: sold_qty)
  end
end
