# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :product_suppliers, dependent: :destroy
  has_many :suppliers, through: :product_suppliers
  has_and_belongs_to_many :categories
  belongs_to :brand
  belongs_to :user
end
