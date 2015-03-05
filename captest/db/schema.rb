# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150305053722) do

  create_table "accesses", force: true do |t|
    t.integer  "meets_id"
    t.integer  "seasons_id"
    t.integer  "events_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "accesses", ["events_id"], name: "index_accesses_on_events_id"
  add_index "accesses", ["meets_id"], name: "index_accesses_on_meets_id"
  add_index "accesses", ["seasons_id"], name: "index_accesses_on_seasons_id"

  create_table "events", force: true do |t|
    t.string   "name"
    t.string   "results"
    t.integer  "meet_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "events", ["meet_id"], name: "index_events_on_meet_id"

  create_table "meets", force: true do |t|
    t.string   "name"
    t.date     "date"
    t.text     "notes"
    t.integer  "season_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "meets", ["season_id"], name: "index_meets_on_season_id"

  create_table "seasons", force: true do |t|
    t.string   "season"
    t.string   "year"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "timers", force: true do |t|
    t.string   "saved_times"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "timers", ["user_id"], name: "index_timers_on_user_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "fname"
    t.string   "lname"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
