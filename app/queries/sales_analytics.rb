# frozen_string_literal: true

class SalesAnalytics < ApplicationQueries
  def call
    if params[:reports] == I18n.t('yearly')
      Product.group_by_year(:created_at).count
    elsif params[:reports] == I18n.t('monthly')
      Product.group_by_month(:created_at).count
    else
      Product.group_by_day(:created_at).count
    end
  end
end
