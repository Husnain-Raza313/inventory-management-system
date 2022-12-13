# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :user
  has_many :products, through: :order_items
  has_many :order_items, dependent: :destroy

  before_save :set_total

  def total
    order_items.collect { |order_item| order_item.valid? ? order_item.total_price : 0 }.sum
  end

  private

  def set_total
    self[:total_price] = total
  end
end
