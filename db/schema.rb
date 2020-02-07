# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_02_07_024005) do

  create_table "booking_details", force: :cascade do |t|
    t.integer "bookings_id", null: false
    t.integer "seats_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bookings_id"], name: "index_booking_details_on_bookings_id"
    t.index ["seats_id"], name: "index_booking_details_on_seats_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.integer "quantity_seat"
    t.integer "users_id", null: false
    t.integer "payments_id", null: false
    t.integer "schedules_id", null: false
    t.float "total_money"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["payments_id"], name: "index_bookings_on_payments_id"
    t.index ["schedules_id"], name: "index_bookings_on_schedules_id"
    t.index ["users_id"], name: "index_bookings_on_users_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "movie_name"
    t.float "price"
    t.string "info"
    t.string "description"
    t.string "trailer"
    t.integer "length_minute"
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "picture"
  end

  create_table "payments", force: :cascade do |t|
    t.string "type_payment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "promotions", force: :cascade do |t|
    t.string "title"
    t.string "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "rattings", force: :cascade do |t|
    t.integer "star"
    t.integer "movies_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["movies_id"], name: "index_rattings_on_movies_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.integer "theaters_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "room_name"
    t.index ["theaters_id"], name: "index_rooms_on_theaters_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.date "day"
    t.time "start_time"
    t.integer "rooms_id", null: false
    t.integer "movies_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["movies_id"], name: "index_schedules_on_movies_id"
    t.index ["rooms_id"], name: "index_schedules_on_rooms_id"
  end

  create_table "seats", force: :cascade do |t|
    t.string "seat_name"
    t.boolean "seat_status"
    t.integer "rooms_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["rooms_id"], name: "index_seats_on_rooms_id"
  end

  create_table "theaters", force: :cascade do |t|
    t.string "theater_name"
    t.string "theater_address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "remember_digest"
    t.integer "role"
    t.string "activation_digest"
    t.boolean "activated"
    t.datetime "activated_at"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.string "phone"
    t.string "gender"
    t.date "birthday"
    t.string "city"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "booking_details", "bookings", column: "bookings_id"
  add_foreign_key "booking_details", "seats", column: "seats_id"
  add_foreign_key "bookings", "payments", column: "payments_id"
  add_foreign_key "bookings", "schedules", column: "schedules_id"
  add_foreign_key "bookings", "users", column: "users_id"
  add_foreign_key "rattings", "movies", column: "movies_id"
  add_foreign_key "rooms", "theaters", column: "theaters_id"
  add_foreign_key "schedules", "movies", column: "movies_id"
  add_foreign_key "schedules", "rooms", column: "rooms_id"
  add_foreign_key "seats", "rooms", column: "rooms_id"
end
