# frozen_string_literal: true
class Category < ApplicationRecord
  has_one_attached :image
  validates :name, presence: true, length: { maximum: 30, minimum: 1 }
  validates :name, uniqueness: true
  validates :description, length: { minimum: 10, maximum: 30 }
  validates :image, presence: true,
                    blob: { content_type: ['image/png', 'image/jpg', 'image/jpeg'], size_range: 1..(5.megabytes) }
  has_many :category_products, dependent: :destroy
  has_many :products, through: :category_products
end
