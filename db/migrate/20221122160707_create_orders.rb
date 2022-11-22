class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :customer_name, null: false, default: ''
      t.string :customer_address
      t.string :phone_no, null: false, default: ''
      t.integer :total_price, null: false, default: 0
      t.timestamps
    end
  end
end
