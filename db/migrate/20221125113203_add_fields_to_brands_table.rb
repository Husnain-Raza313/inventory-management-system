class AddFieldsToBrandsTable < ActiveRecord::Migration[6.1]
  def change
    add_column :brands, :description, :text
    add_column :brands, :image, :string
  end
end
