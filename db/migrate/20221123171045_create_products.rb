# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :serial_no, null: false, default: '', limit: 30
      t.string :name, null: false, default: '', limit: 30
      t.text :description
      t.string :image
      t.integer :quantity, null: false, default: 0
      t.integer :sold_quantity, null: false, default: 0
      t.boolean :available, null: false, default: true
      t.integer :price_per_unit, null: false, default: 0
      t.integer :bulk_price, null: false, default: 0
      t.integer :retail_price, null: false, default: 0
      t.references :brand, null: false, foreign_key: true
      t.timestamps
    end
  end
end
