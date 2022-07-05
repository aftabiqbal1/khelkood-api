class AddOrderDetailsRefToTransactionDetails < ActiveRecord::Migration[7.0]
  def change
    add_reference :transaction_details, :order_details, foreign_key: true
  end
end
