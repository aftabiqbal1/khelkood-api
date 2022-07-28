class AddCustomToUsers2 < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :mobile_number, :string
    add_column :users, :city, :string
    add_column :users, :address, :string
    add_column :users, :role, :integer
  end
end
