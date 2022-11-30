class SuppliersController < ApplicationController
  before_action :set_supplier, only: %i[ show edit update destroy ]

  def index
    @suppliers = Supplier.all
  end

  def show
  end

  def new
    @supplier = Supplier.new
  end

  def edit
  end

  def create
    @supplier = Supplier.new(supplier_params)
    if @supplier.save
      flash[:success] = t('supplier.create.success')
      redirect_to supplier_url(@supplier)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @supplier.update(supplier_params)
      flash[:success] = t('supplier.update.success')
      redirect_to supplier_url(@supplier)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @supplier.destroy
      flash[:success] = t('supplier.destroy.success')
    else
      flash[:danger] = @supplier.errors.full_messages.to_sentence
    end
    redirect_to suppliers_url
  end

  private
    def set_supplier
      @supplier = Supplier.find_by_id(params[:id])
    end

    def supplier_params
      params.require(:supplier).permit(:name, :supplier_address, :phone_no, :image)
    end
end
