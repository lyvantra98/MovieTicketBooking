class CreateBookingDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :booking_details do |t|
      t.references :bookings, null: false, foreign_key: true
      t.references :seats, null: false, foreign_key: true

      t.timestamps
    end
  end
end
