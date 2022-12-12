class ReportsController < ApplicationController
  def index
    @product = SalesAnalytics.new(params[:reports]).call if params[:reports].present?
  end

  def analytics
    @product = Product.find(params[:id])
    @product = ProductAnalytics.new(@product, params[:type]).call
  end
end
