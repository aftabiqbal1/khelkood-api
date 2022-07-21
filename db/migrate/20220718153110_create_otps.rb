class CreateOtps < ActiveRecord::Migration[7.0]
  def change
    create_table :otps do |t|
      t.bigint :mobile_number
      t.integer :otp

      t.timestamps
    end
  end
end
