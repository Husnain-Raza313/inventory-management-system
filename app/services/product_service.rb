# frozen_string_literal: true

class ProductService < ApplicationService
  attr_reader :product, :product_category_ids, :product_supplier_ids, :brand_ids, :products

  def initialize(**args)
    super
    if params[:brand].present?
      @product = params[:brand].products.new(params[:product_params])
      @product_supplier_ids = params[:supplier_ids].drop(1)
    else
      @brand_ids = params[:brand_ids].drop(1)
      @products = params[:products]
    end
    @product_category_ids = params[:category_ids].drop(1)
  end

  def execute
    assign_categories_and_supplier_to_product
  end

  def filter
    search_brands_and_categories
  end

  private

  def assign_categories_and_supplier_to_product
    if product_category_ids.present? && product_supplier_ids.present?
      product_category_ids.each do |product_category_id|
        category = Category.find(product_category_id)
        product.categories << category
        product_supplier_ids.each do |product_supplier_id|
          supplier = Supplier.find(product_supplier_id)
          product.suppliers << supplier
        end
      end

      { product: product, message: nil }
    else
      { product: nil, message: I18n.t('select_category_and_supplier') }
    end
  end

  def search_brands_and_categories
    @products = @products.where(brand_id: brand_ids) if brand_ids.present?
    return @products unless product_category_ids.present?

    @products = @products.joins(:category_products).where(category_products: { category_id: product_category_ids })
  end
end
