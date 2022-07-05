class CreateSportsComplexReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :sports_complex_reviews do |t|
      t.string :rating
      t.text :description

      t.timestamps
    end
  end
end
