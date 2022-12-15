# frozen_string_literal: true

class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  before_save :set_total_price
  scope :product_ids, -> { pluck(:product_id) }
  scope :product_quantity, ->(id){ where(product_id: id).pluck(:quantity)[0] }

  def total_price
    product.retail_price * self.quantity
  end

  private

  def set_total_price
    self.total_price = total_price
  end
end
