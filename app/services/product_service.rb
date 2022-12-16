class ProductService < ApplicationService
  def initialize(category_ids, supplier_ids, flash, brand, product_params)
    @category_ids = category_ids
    @supplier_ids = supplier_ids
    @flash = flash
    @brand = brand
    @product = @brand.products.new(product_params)
  end

  def execute
    assign_categories_and_supplier_to_product
    @product
  end

  private

  def remove_empty_array_elements
    @product_category = @category_ids.reject { |e| e.nil? || e&.empty? }
    @product_supplier = @supplier_ids.reject { |e| e.nil? || e&.empty? }
    [@product_category, @product_supplier]
  end

  def assign_categories_and_supplier_to_product
    remove_empty_array_elements  if @category_ids.present? && @supplier_ids.present?
    if @product_category.present? && @product_supplier.present?
      @product_category.each do |_product_category|
        @category = Category.find(_product_category)
        @product.categories << @category
        @product_supplier.each do |_product_supplier|
          @supplier = Supplier.find(_product_supplier)
          @product.suppliers << @supplier
        end
      end

    else
      @product.errors.add(:base, I18n.t('select_category_and_supplier'))
      nil
    end
  end
end
