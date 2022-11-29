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
      redirect_to brand_url(@brand), notice: 'Brand was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @brand.update(brand_params)
      redirect_to brand_url(@brand), notice: 'Brand was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @brand.destroy
      flash[:success] = 'Brand was successfully destroyed.'
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
