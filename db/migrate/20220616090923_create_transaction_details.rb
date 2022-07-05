class CreateTransactionDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :transaction_details do |t|
      t.string :payment_mode
      t.text :content
      t.boolean :status

      t.timestamps
    end
  end
end
