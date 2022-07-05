class CreateCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :carts do |t|
      t.float :sub_total
      t.string :city
      t.text :address
      t.boolean :status

      t.timestamps
    end
  end
end
