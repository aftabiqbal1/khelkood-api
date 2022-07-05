class AddSportsComplexRefToBookings < ActiveRecord::Migration[7.0]
  def change
    add_reference :bookings, :sports_complex, foreign_key: true
  end
end
