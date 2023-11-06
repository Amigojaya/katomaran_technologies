class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.string :status, default: 'pending'
      t.datetime :booking_date
      t.integer :user_id

      t.timestamps
    end
  end
end
