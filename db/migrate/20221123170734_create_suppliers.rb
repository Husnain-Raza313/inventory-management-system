class CreateSuppliers < ActiveRecord::Migration[6.1]
  def change
    create_table :suppliers do |t|
      t.string :name, null: false, default: '', limit: 30
      t.string :supplier_address, null: false, default: ''
      t.string :phone_no, null: false, default: '', limit: 15
      t.timestamps
    end
  end
end
