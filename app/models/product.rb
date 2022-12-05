# frozen_string_literal: true

class Product < ApplicationRecord
  validates :name, :image, :description, :serial_no, :bulk_price, :price_per_unit, :retail_price, presence: true
  validates :serial_no, :description, length: { minimum: 10, maximum: 30 }
  validates :bulk_price, numericality: { greater_than: :price_per_unit }
  validates :price_per_unit, numericality: { greater_than: :retail_price }
  validate :image_type, if: -> { image.attached? && !image.content_type.in?(%('image/jpeg image/png image/heic')) }
  has_many :product_suppliers, dependent: :destroy
  has_many :suppliers, through: :product_suppliers

  has_many :category_products, dependent: :destroy
  has_many :categories, through: :category_products

  belongs_to :brand
  has_one_attached :image, dependent: :destroy

  after_create :remove_empty_array_elements

  private

  def image_type
    errors.add(:image, I18n.t('product.image'))
  end
end
