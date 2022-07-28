class UpdateForeignKeys < ActiveRecord::Migration[7.0]
  def change
    def change
      # remove the old foreign_key
      remove_foreign_key :bookings, :sports_complex
      remove_foreign_key :sports_complex_reviews, :sports_complex


      # add the new foreign_key
      remove_foreign_key :bookings, :sports_complex, on_delete: :cascade
      remove_foreign_key :sports_complex_reviews, :sports_complex, on_delete: :cascade
    end
  end
end
