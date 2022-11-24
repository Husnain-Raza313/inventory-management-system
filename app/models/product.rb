# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :product_suppliers, dependent: :destroy
  has_many :suppliers, through: :product_suppliers

  has_many :category_products, dependent: :destroy
  has_many :categories, through: :category_products

  belongs_to :brand
  belongs_to :user
end
