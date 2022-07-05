class AddProductRefToProductReview < ActiveRecord::Migration[7.0]
  def change
    add_reference :product_reviews, :product, foreign_key: true
  end
end
