# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :user
  has_many :products, through: :order_items
  has_many :order_items, dependent: :destroy

  before_save :set_total
  after_update :set_sold_quantity

  def total
    order_items.collect { |order_item| order_item.valid? ? order_item.total_price : 0 }.sum
  end

  private

  def set_total
    self.total_price = total
  end

  def set_sold_quantity
    order_items.collect do |order_item|
      product = Product.find(order_item.product_id)
      qty = product.quantity - order_item.quantity
      sold_qty = product.sold_quantity + order_item.quantity
      product.update(quantity: qty, sold_quantity: sold_qty)
    end
  end
end
