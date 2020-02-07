class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.integer :amount
      t.references :users, null: false, foreign_key: true
      t.references :payments, null: false, foreign_key: true
      t.references :schedules, null: false, foreign_key: true
      t.float :total

      t.timestamps
    end
  end
end
