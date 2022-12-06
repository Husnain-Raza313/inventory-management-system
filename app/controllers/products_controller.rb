class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]
  before_action :set_brand, only: %i[create]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = @brand.products.new(product_params)
    assign_categories_and_supplier_to_product
    
    if @product.save
      flash[:success] = t('create.success', param: 'Product')
      redirect_to product_url(@product)
    else
      flash[:warning] = @product.errors.full_messages.to_sentence
      redirect_to new_product_url(@product)
    end
  end

  def show; end
  def edit; end

  def update
    if @product.update(product_params)
      flash[:success] = t('update.success', param: 'Product')
      redirect_to product_url(@product)
    else
      flash[:warning] = @product.errors.full_messages.to_sentence
      redirect_to edit_product_url(@product)
    end
  end

  def destroy
    if @product.destroy
      flash[:success] = t('destroy.success', param: 'Product')
    else
      flash[:danger] = @product.errors.full_messages.to_sentence
    end

    redirect_to product_url
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def set_brand
    @brand = Brand.find(params[:product][:brand_id])
  end

  def remove_empty_array_elements
    @product_category = params[:product][:category_ids].reject { |e| e.nil? || e&.empty? }
    @product_supplier = params[:product][:supplier_ids].reject { |e| e.nil? || e&.empty? }
    [@product_category, @product_supplier]
  end

  def assign_categories_and_supplier_to_product
    remove_empty_array_elements if params[:product][:category_ids].present? && params[:product][:supplier_ids].present?
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
      flash[:alert] = t('invaliddata')
      nil
    end
  end

  def product_params
    params.require(:product).permit(:serial_no, :name, :description, :image, :quantity, :price_per_unit,
                                    :retail_price, :bulk_price, :brand_id)
  end
end
