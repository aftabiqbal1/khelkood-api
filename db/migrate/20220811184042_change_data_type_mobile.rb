class ChangeDataTypeMobile < ActiveRecord::Migration[7.0]
  def change
    change_column :otps, :mobile_number, :string, unique: :true
  end
end
