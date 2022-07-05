class RemoveReviewsFromSportsComplex < ActiveRecord::Migration[7.0]
  def change
    remove_column :sports_complexes, :reviews, :string
  end
end
