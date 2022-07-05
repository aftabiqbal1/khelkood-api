class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.datetime :date
      t.string :time_slot
      t.boolean :cancelled_status
      t.boolean :paid_status

      t.timestamps
    end
  end
end
