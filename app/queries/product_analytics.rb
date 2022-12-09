# frozen_string_literal: true

class ProductAnalytics
  attr_reader :product, :type

  def initialize(product, type)
    @product = product
    @type = type
  end

  def call
    if @type == t('remaining')
      exec_query(remaining_quantity_of_products)&.rows
    elsif @type == t('sold')
      exec_query(sold_quantity_of_products)&.rows
    else
      byebug
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
    "SELECT products.name, Count(order_items.quantity) FROM products,order_items where order_items.product_id= #{@product.id} GROUP BY products.name"
  end
end
