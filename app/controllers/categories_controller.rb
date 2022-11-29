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
      flash[:success] = t('category.create.success')
      redirect_to category_url(@category)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show; end
  def edit; end

  def update
    if @category.update(category_params)
      flash[:success] = t('category.update.success')
      redirect_to category_url(@category)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @brand.destroy
      flash[:success] = t('category.destroy.success')
    else
      flash[:danger] = @category.errors.full_messages.to_sentence
    end
    redirect_to category_url
  end

  private

  def set_category
    @category = Category.find_by(id: params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :description, :image)
  end
end
