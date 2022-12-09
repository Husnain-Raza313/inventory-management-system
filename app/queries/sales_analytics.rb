class SalesAnalytics
  attr_reader :reports

  def initialize(reports)
    @reports = reports
  end

  def call
    if @reports == I18n.t('yearly')
      Product.group_by_year(:created_at).count
    elsif @reports == I18n.t('monthly')
      Product.group_by_month(:created_at).count
    else
      Product.group_by_day(:created_at).count
    end
  end
end
