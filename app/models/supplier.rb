# frozen_string_literal: true

class Supplier < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30, minimum: 5 }
  validates :name, uniqueness: true
  validates :image, presence: true,
                    blob: { content_type: ALLOWED_IMAGE_TYPES, size_range: ALLOWED_IMAGE_SIZE }
  validates :phone_no, presence: true, length: { maximum: 15 }
  validates :supplier_address, presence: true, length: { minimum: 10 }

  has_many :product_suppliers, dependent: :destroy
  has_many :products, through: :product_suppliers
  has_one_attached :image
end
