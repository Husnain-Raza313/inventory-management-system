class ReportsController < ApplicationController
  def index
    @product = SalesAnalytics.new(reports: params[:reports]).call if params[:reports].present?
  end

  def analytics
    @product = Product.find(params[:id])
    @product = ProductAnalytics.new(product: @product, type: params[:type]).call
  end
end
