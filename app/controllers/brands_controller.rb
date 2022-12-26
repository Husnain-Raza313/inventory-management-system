# frozen_string_literal: true

class BrandsController < ApplicationController
  before_action :set_brand, only: %i[show edit update destroy]

  def index
    @brands = Brand.paginate(page: params[:page], per_page: RECORDS_PER_PAGE).all
  end

  def show; end

  def new
    @brand = Brand.new
  end

  def edit; end

  def create
    @brand = Brand.new(brand_params)
    if @brand.save
      flash[:success] = t('create.success', param: 'brand')
      redirect_to brand_url(@brand)
    else
      flash[:warning] = @brand.errors.full_messages
      render :new
    end
  end

  def update
    if @brand.update(brand_params)
      flash[:success] = t('update.success', param: 'brand')
      redirect_to brand_url(@brand)
    else
      flash[:warning] = @brand.errors.full_messages
      render :edit
    end
  end

  def destroy
    if @brand.destroy
      flash[:success] = t('destroy.success', param: 'brand')
    else
      flash[:danger] = @brand.errors.full_messages
    end

    redirect_to brands_url
  end

  private

  def set_brand
    @brand = Brand.find(params[:id])
  end

  def brand_params
    params.require(:brand).permit(:name, :description, :image)
  end
end
