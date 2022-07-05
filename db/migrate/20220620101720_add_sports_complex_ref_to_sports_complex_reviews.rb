class AddSportsComplexRefToSportsComplexReviews < ActiveRecord::Migration[7.0]
  def change
    add_reference :sports_complex_reviews, :sports_complex, optional:true, foreign_key: true
  end
end
