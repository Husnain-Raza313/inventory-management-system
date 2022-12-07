class ReportsController < ApplicationController
  def index
    byebug
    if params[:reports].present? && params[:reports]=="Yearly"
      @product = Product.group_by_year(:created_at).count 
    elsif params[:reports].present? && params[:reports]=="Monthly"
      @product = Product.group_by_month(:created_at).count
    else
      @product = Product.group_by_day(:created_at).count
    end
    respond_to do |format|
      format.html{} 
      format.js{}
  end
end
end
