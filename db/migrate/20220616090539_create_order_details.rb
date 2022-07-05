class CreateOrderDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :order_details do |t|
      t.integer :quantity
      t.boolean :payment_status
      t.boolean :shipped_status
      t.float :total_bill
      t.boolean :cancelled_status
      t.text :cancellation_reason

      t.timestamps
    end
  end
end
