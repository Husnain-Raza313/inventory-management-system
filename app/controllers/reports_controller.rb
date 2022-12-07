class ReportsController < ApplicationController
  def index
    byebug
    @product = Product.group(:name).count
    respond_to do |format|
      format.html
      format.json { render json: @product }
    end
    
  end
end
