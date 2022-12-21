class OrderItemService < ApplicationService
  attr_reader :product_id, :quantity, :product_quantity, :order_array

  def initialize(**args)
    super
    @session = params[:session]
    @args = params[:args]
    @product_id = @args[:product_id]
    @quantity = @args[:quantity].to_i
    @product_quantity = @session[:product_quantity]
    @order_array = @session[:order_array]

  end

  def execute
    create_or_update_order_item
  end

  private

  def create_or_update_order_item
    type = "success"
    if order_array.include?(product_id)
      product_quantity = quantity
      if product_quantity.blank?
        type = "error"
        message = I18n.t('error-message')
      else
        message = I18n.t("update.success", param: 'Order Item')
      end

    else
      order_array.append(product_id)
      product_quantity = quantity
      message = I18n.t("create.success", param: 'Order Item')
    end

    [order_array, product_quantity, message, type]
  end
end

# /**
#   # if (arr.includes(:pro))
#   #   update
#   # else
#   #   create
#   # end

# */
