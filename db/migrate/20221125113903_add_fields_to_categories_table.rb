# frozen_string_literal: true

class AddFieldsToCategoriesTable < ActiveRecord::Migration[6.1]
  def change
    add_column :categories, :description, :text
    add_column :categories, :image, :string
  end
end
