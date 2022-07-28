class AddUserRefToSportsComplexes < ActiveRecord::Migration[7.0]
  def change
    add_reference :sports_complexes, :user, foreign_key: true
  end
end
