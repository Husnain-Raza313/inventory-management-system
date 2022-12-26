# frozen_string_literal: true

class ProductAnalytics < ApplicationQueries
  def call
    if params[:type] == I18n.t('remaining')
      exec_query(remaining_quantity_of_products)&.rows
    else
      exec_query(sold_quantity_of_products)&.rows
    end
  end

  private

  def remaining_quantity_of_products
    "Select name, SUM(quantity) from products WHERE id = #{params[:product].id} GROUP BY name"
  end

  def sold_quantity_of_products
    "SELECT products.name, SUM(order_items.quantity) FROM products,order_items where products.id=order_items.product_id and order_items.product_id= #{params[:product].id} GROUP BY products.name"
  end
end
