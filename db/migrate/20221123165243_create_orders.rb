# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :customer_name, null: false, default: '', limit: 30
      t.string :customer_address
      t.string :phone_no, null: false, default: '', limit: 15
      t.integer :total_price, null: false, default: 0
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
