class AddProductRefToStore < ActiveRecord::Migration[7.0]
  def change
    add_reference :stores, :product, foreign_key: true
  end
end
