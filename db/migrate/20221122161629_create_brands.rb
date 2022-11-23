# frozen_string_literal: true

class CreateBrands < ActiveRecord::Migration[6.1]
  def change
    create_table :brands do |t|
      t.string :name, null: false, default: ''
      t.timestamps
    end
  end
end
