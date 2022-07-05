class AddColumnsToTeam < ActiveRecord::Migration[7.0]
  def change
    add_column :teams, :matches_played, :integer
    add_column :teams, :wins, :integer
    add_column :teams, :loses, :integer
    add_column :teams, :draw, :integer
    add_column :teams, :win_average, :float
  end
end
