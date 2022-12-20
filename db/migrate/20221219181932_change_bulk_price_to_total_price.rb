class ChangeBulkPriceToTotalPrice < ActiveRecord::Migration[6.1]
  def change
    rename_column :products, :bulk_price, :total_price
  end
end
