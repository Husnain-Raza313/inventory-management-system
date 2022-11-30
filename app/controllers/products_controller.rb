class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      flash[:success] = t('product.create.success')
      redirect_to product_url(@product)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show; end
  def edit; end

  def update
    if @product.update(product_params)
      flash[:success] = t('product.update.success')
      redirect_to product_url(@product)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @product.destroy
      flash[:success] = t('product.destroy.success')
    else
      flash[:danger] = @product.errors.full_messages.to_sentence
    end
    redirect_to product_url
  end

  private

  def set_product
    @product = Product.find_by(id: params[:id])
  end

  def product_params
    params.require(:product).permit(:serial_no, :name, :description, :image, :quantity, :price_per_unit, :bulk_price,
                                    :retail_price)
  end
end