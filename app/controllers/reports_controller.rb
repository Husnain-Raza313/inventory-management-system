class ReportsController < ApplicationController
  def index
    @product = if params[:reports].present? && params[:reports] == 'Yearly'
                 Product.group_by_year(:created_at).count
               elsif params[:reports].present? && params[:reports] == 'Monthly'
                 Product.group_by_month(:created_at).count
               else
                 Product.group_by_day(:created_at).count
               end
    respond_to do |format|
      format.js {}
      format.html {}
    end
  end

  def analytics
    @product = Product.find(params[:id])
    @product = ProductAnalytics.new(@product, params[:type]).call
  end
end
