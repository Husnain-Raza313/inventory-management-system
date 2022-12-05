# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit update destroy]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:success] = t('create.success', param: 'category')
      redirect_to category_path(@category)
    else
      flash[:warning] = @category.errors.full_messages.to_sentence
      redirect_to new_category_path
    end
  end

  def show; end
  def edit; end

  def update
    if @category.update(category_params)
      flash[:success] = t('update.success', param: 'category')
      redirect_to category_url(@category)
    else
      flash[:warning] = @category.errors.full_messages.to_sentence
      redirect_to edit_category_path(@category)
    end
  end

  def destroy
    if @category.destroy
      flash[:success] = t('destroy.success', param: 'category')
    else
      flash[:danger] = @category.errors.full_messages.to_sentence
    end

    redirect_to category_url
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :description, :image)
  end
end
