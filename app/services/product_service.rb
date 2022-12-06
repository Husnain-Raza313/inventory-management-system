class ProductService
  def self.remove_empty_array_elements(category_ids, supplier_ids)
    @product_category = category_ids.reject { |e| e.nil? || e&.empty? }
    @product_supplier = supplier_ids.reject { |e| e.nil? || e&.empty? }
    [@product_category, @product_supplier]
  end

  def self.assign_categories_and_supplier_to_product(category_ids, supplier_ids, flash)
    remove_empty_array_elements(category_ids, supplier_ids) if category_ids.present? && supplier_ids.present?
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
      flash[:alert] = I18n.t('select_category_and_supplier')
      nil
    end
  end
end
