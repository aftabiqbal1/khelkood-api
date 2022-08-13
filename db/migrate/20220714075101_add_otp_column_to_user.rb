class AddOtpColumnToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :otp, :bigint
  end
end
