# frozen_string_literal: true

class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  before_save :set_total_price

  def total_price
    product.retail_price * quantity
  end

  private

  def set_total_price
    self[:total_price] = total_price
  end
end
