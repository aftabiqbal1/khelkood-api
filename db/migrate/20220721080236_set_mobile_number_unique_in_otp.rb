class SetMobileNumberUniqueInOtp < ActiveRecord::Migration[7.0]
  def change
    add_index :otps, :mobile_number, unique:true
  end
end
