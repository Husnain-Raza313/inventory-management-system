# frozen_string_literal: true

class Brand < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30, minimum: 1 }
  validates :name, uniqueness: true
  validates :image, presence: true,
                    blob: { content_type: ALLOWED_IMAGE_TYPES, size_range: ALLOWED_IMAGE_SIZE }
  validates :description, presence: true, length: { minimum: 10, maximum: 400 }

  has_one_attached :image
  has_many :products, dependent: :destroy
end
