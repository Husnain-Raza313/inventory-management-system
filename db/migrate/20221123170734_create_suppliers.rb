class CreateSuppliers < ActiveRecord::Migration[6.1]
  def change
    create_table :suppliers do |t|
      t.string :name, null: false, default: '', limit: 30
      t.timestamps
    end
  end
end
