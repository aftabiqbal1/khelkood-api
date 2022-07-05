class AddProductRefToOrderDetails < ActiveRecord::Migration[7.0]
  def change
    add_reference :order_details, :product, foreign_key: true
  end
end
