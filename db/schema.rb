# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20210616224503) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.string "years_range"
    t.integer "laps"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "group"
    t.boolean "active", default: true
  end

  create_table "race_time_lapses", force: :cascade do |t|
    t.bigint "register_id"
    t.bigint "rider_id"
    t.datetime "start_lap"
    t.datetime "end_lap"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["register_id"], name: "index_race_time_lapses_on_register_id"
    t.index ["rider_id"], name: "index_race_time_lapses_on_rider_id"
  end

  create_table "races", id: :serial, force: :cascade do |t|
    t.string "title"
    t.date "date"
    t.string "photo"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "registers", id: :serial, force: :cascade do |t|
    t.integer "category"
    t.integer "race_id"
    t.integer "rider_id"
    t.string "race_result"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "points"
    t.index ["race_id"], name: "index_registers_on_race_id"
    t.index ["rider_id"], name: "index_registers_on_rider_id"
  end

  create_table "riders", id: :serial, force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.date "birthdate"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "phone"
    t.string "email"
    t.string "bood_type"
    t.integer "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "category_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "race_time_lapses", "registers"
  add_foreign_key "race_time_lapses", "riders"
  add_foreign_key "registers", "races"
  add_foreign_key "registers", "riders"
end
