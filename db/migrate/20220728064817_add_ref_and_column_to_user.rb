class AddRefAndColumnToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :team, foreign_key: true
    add_column :users, :name, :string
  end
end
