# frozen_string_literal: true

class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.integer :quantity, null: false, default: 0
      t.integer :total_price, null: false, default: 0
      t.timestamps
    end
  end
end
