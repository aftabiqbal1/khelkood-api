class CreateSportsComplexes < ActiveRecord::Migration[7.0]
  def change
    create_table :sports_complexes do |t|
      t.string :name
      t.string :image
      t.string :reviews
      t.string :city
      t.string :address
      t.string :cost_hr
      t.string :timing
      t.boolean :snacks_availability
      t.string :ground_type
      t.integer :No_of_stadiums

      t.timestamps
    end
  end
end
