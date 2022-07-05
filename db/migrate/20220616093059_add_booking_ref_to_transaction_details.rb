class AddBookingRefToTransactionDetails < ActiveRecord::Migration[7.0]
  def change
    add_reference :transaction_details, :booking, foreign_key: true
  end
end
