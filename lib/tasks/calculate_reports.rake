# rake reports:calculate_reports
$total_retail_price_of_products = 0
$total_price_of_product = 0

namespace :reports do
  desc 'Monthly Profit'
  task calculate_monthly_profit: :environment do
    @product = Product.joins(:orders).where(orders: { created_at: Date.today.beginning_of_month..Date.today.end_of_month })
    calculate_profit(@product)
  end

  desc 'Yearly Profit'
  task calculate_yearly_profit: :environment do
    @product = Product.joins(:orders).where(orders: { created_at: Date.today.beginning_of_year..Date.today.end_of_year })
    calculate_profit(@product)
  end

  desc 'Daily Profit'
  task calculate_daily_profit: :environment do
    @product = Product.joins(:orders).where(orders: { created_at: Date.today.beginning_of_day..Date.today.end_of_day })
    calculate_profit(@product)
  end

  def calculate_profit(product)
    product.each do |product|
      product.order_items.each do |prod_item|
        $total_retail_price_of_products = $total_retail_price_of_products + (product.retail_price * prod_item.quantity)
        $total_price_of_product = $total_price_of_product + (product.price_per_unit * prod_item.quantity)
      end
    end

    profit = $total_retail_price_of_products - $total_price_of_product
    puts 'Revenue ::', $total_retail_price_of_products
    puts 'Expenditure ::', $total_price_of_product
    puts 'Profit ::', profit
  end
end
