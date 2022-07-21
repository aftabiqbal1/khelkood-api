class AddVerifiedColumnToOtp < ActiveRecord::Migration[7.0]
  def change
    add_column :otps, :verified, :boolean, default: false
  end
end