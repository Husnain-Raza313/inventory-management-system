# frozen_string_literal: true

class SuppliersController < ApplicationController
  before_action :set_supplier, only: %i[show edit update destroy]

  def index
    @suppliers = Supplier.all
  end

  def show; end

  def new
    @supplier = Supplier.new
  end

  def edit; end

  def create
    @supplier = Supplier.new(supplier_params)

    if @supplier.save
      flash[:success] = t('create.success', param: 'supplier')
      redirect_to supplier_url(@supplier)
    else
      flash[:warning] = @supplier.errors.full_messages
      render :new
    end
  end

  def update
    if @supplier.update(supplier_params)
      flash[:success] = t('update.success', param: 'supplier')
      redirect_to supplier_url(@supplier)
    else
      flash[:warning] = @supplier.errors.full_messages
      render :edit
    end
  end

  def destroy
    if @supplier.destroy
      flash[:success] = t('destroy.success', param: 'supplier')
    else
      flash[:danger] = @supplier.errors.full_messages
    end

    redirect_to suppliers_url
  end

  private

  def set_supplier
    @supplier = Supplier.find(params[:id])
  end

  def supplier_params
    params.require(:supplier).permit(:name, :supplier_address, :phone_no, :image)
  end
end
