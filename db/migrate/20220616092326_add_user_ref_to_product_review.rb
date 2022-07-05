class AddUserRefToProductReview < ActiveRecord::Migration[7.0]
  def change
    add_reference :product_reviews, :user, foreign_key: true
  end
end
