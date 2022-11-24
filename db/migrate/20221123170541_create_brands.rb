class CreateBrands < ActiveRecord::Migration[6.1]
  def change
    create_table :brands do |t|
      t.string :name, null: false, default: '', limit: 30
      t.timestamps
    end
  end
end
