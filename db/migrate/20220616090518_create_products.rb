class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.string :sku
      t.string :size
      t.string :category
      t.float :price
      t.integer :stock_quantity
      t.string :gender_category

      t.timestamps
    end
  end
end
