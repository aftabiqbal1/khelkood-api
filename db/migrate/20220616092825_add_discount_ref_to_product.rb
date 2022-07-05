class AddDiscountRefToProduct < ActiveRecord::Migration[7.0]
  def change
    add_reference :products, :discount, foreign_key: true
  end
end
