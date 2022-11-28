# frozen_string_literal: true

class Brand < ApplicationRecord
  has_one_attached :image

  validates :name, presence: true, length: { maximum: 30, minimum: 1 }

  has_many :products, dependent: :destroy
end
