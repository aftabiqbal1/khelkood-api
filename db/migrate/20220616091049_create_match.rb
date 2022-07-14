class CreateMatch < ActiveRecord::Migration[7.0]
  def change
    create_table :matches do |t|
      t.string :name
      t.integer :winner
      t.integer :team_a_score
      t.integer :team_b_score
      t.integer :team_a_wickets
      t.integer :team_b_wickets
      t.float :team_a_overs
      t.float :team_b_overs
      t.float :team_a_runrate
      t.float :team_b_runrate

      t.timestamps
    end
  end
end
