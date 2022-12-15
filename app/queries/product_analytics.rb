# frozen_string_literal: true

class ProductAnalytics < ApplicationQueries
  attr_reader :product, :type

  def initialize(product, type)
    @product = product
    @type = type
  end

  def call
    if @type == I18n.t('remaining')
      exec_query(remaining_quantity_of_products)&.rows
    else
      exec_query(sold_quantity_of_products)&.rows
    end
  end

  private

  def exec_query(query)
    ActiveRecord::Base.connection.exec_query(query)
  end

  def remaining_quantity_of_products
    "Select name,Count(quantity) from products WHERE id = #{@product.id} GROUP BY name"
  end

  def sold_quantity_of_products
    "SELECT products.name, Count(order_items.quantity) FROM products,order_items where products.id=order_items.product_id and order_items.product_id= #{@product.id}  GROUP BY products.name"
  end
end
