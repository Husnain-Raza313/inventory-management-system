# frozen_string_literal: true

class BrandsController < ApplicationController
  before_action :set_brand, only: %i[show edit update destroy]

  def index
    @brands = Brand.all
  end

  def show; end

  def new
    @brand = Brand.new
  end

  def edit; end

  def create
    @brand = Brand.new(brand_params)
    if @brand.save
      flash[:success] = t('brand.create.success')
      redirect_to brand_url(@brand)
    else
      render :new
    end

  end

  def update
    if @brand.update(brand_params)
      flash[:success] = t('brand.update.success')
      redirect_to brand_url(@brand)
    else
      render :edit
    end

  end

  def destroy
    if @brand.destroy
      flash[:success] = t('brand.destroy.success')
    else
      flash[:danger] = @brand.errors.full_messages.to_sentence
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
