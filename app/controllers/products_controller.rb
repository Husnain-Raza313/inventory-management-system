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
    result = ProductService.new(params[:product][:category_ids], params[:product][:supplier_ids], flash, @product).execute
    if result.present? && @product.save
      flash[:success] = t('create.success', param: 'Product')
      redirect_to product_url(@product)
    else
      flash[:warning] = @product.errors.full_messages
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
      flash[:warning] = @product.errors.full_messages
      redirect_to edit_product_url(@product)
    end
  end

  def destroy
    if @product.destroy
      flash[:success] = t('destroy.success', param: 'Product')
    else
      flash[:danger] = @product.errors.full_messages
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

  def product_params
    params.require(:product).permit(:serial_no, :name, :description, :image, :quantity, :price_per_unit,
                                    :retail_price, :bulk_price, :brand_id)
  end
end
