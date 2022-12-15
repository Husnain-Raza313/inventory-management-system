# frozen_string_literal: true

class Product < ApplicationRecord
  UNIQUE_SERIAL_NO_LENGTH = 5
  validates :name, :image, :description, :bulk_price, :price_per_unit, :retail_price, presence: true
  validates :bulk_price, numericality: { greater_than: :price_per_unit }
  validates :retail_price, numericality: { greater_than: :price_per_unit }
  validates :image, presence: true,
                    blob: { content_type: ALLOWED_IMAGE_TYPES, size_range: ALLOWED_IMAGE_SIZE }

  has_many :product_suppliers, dependent: :destroy
  has_many :suppliers, through: :product_suppliers
  has_many :category_products, dependent: :destroy
  has_many :categories, through: :category_products
  has_many :order_items, dependent: :destroy
  has_many :orders, through: :order_items
  belongs_to :brand
  has_one_attached :image, dependent: :destroy

  before_create :generate_serial_number

  def generate_serial_number
    serial_number = [*('A'..'Z')].sample(UNIQUE_SERIAL_NO_LENGTH).join
    product = Product.find_by(serial_no: serial_number)
    if product.present?
      generate_serial_number
    else
      self.serial_no = serial_number
    end
  end
end
