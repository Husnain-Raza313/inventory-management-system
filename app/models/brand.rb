# frozen_string_literal: true

class Brand < ApplicationRecord
  mount_uploader :image, ImageUploader

  validates :name, presence: true, length: { maximum: 30, minimum: 1 }

  has_many :products, dependent: :destroy
end
