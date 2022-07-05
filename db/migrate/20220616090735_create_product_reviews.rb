class CreateProductReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :product_reviews do |t|
      t.string :rating
      t.text :desc

      t.timestamps
    end
  end
end
