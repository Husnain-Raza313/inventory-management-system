# frozen_string_literal: true

class Category < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30, minimum: 1 }
  validates :name, uniqueness: true
  validates :description, length: { minimum: 10, maximum: 30 }
  validates :image, presence: true,
                    blob: { content_type: ALLOWED_IMAGE_TYPES, size_range: ALLOWED_IMAGE_SIZE }

  has_one_attached :image
  has_many :category_products, dependent: :destroy
  has_many :products, through: :category_products
end
