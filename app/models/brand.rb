# frozen_string_literal: true

class Brand < ApplicationRecord
  has_one_attached :image

  validates :name, presence: true, length: { maximum: 30, minimum: 1 }
  validates :image, presence: true,
                    blob: { content_type: ['image/png', 'image/gif', 'image/jpg', 'image/jpeg'], size_range: 1..(5.megabytes) }
  validates :description, presence: true, length: { minimum: 10, maximum: 400 }
  has_many :products, dependent: :destroy
end
