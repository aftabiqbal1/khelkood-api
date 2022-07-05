class AddUserRefToTransactionDetails < ActiveRecord::Migration[7.0]
  def change
    add_reference :transaction_details, :user,foreign_key: true
  end
end
