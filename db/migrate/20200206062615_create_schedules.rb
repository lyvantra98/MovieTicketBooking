class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.date :start_day
      t.time :start_time
      t.references :rooms, null: false, foreign_key: true
      t.references :movies, null: false, foreign_key: true

      t.timestamps
    end
  end
end
