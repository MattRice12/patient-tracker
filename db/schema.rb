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

ActiveRecord::Schema.define(version: 20170112003319) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "days", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "month_id"
    t.boolean  "locked",           default: true
    t.date     "date"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "insureds_count"
    t.integer  "uninsureds_count"
    t.index ["month_id"], name: "index_days_on_month_id", using: :btree
    t.index ["user_id"], name: "index_days_on_user_id", using: :btree
  end

  create_table "insureds", force: :cascade do |t|
    t.integer  "day_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["day_id"], name: "index_insureds_on_day_id", using: :btree
  end

  create_table "months", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_months_on_user_id", using: :btree
  end

  create_table "uninsureds", force: :cascade do |t|
    t.integer  "day_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["day_id"], name: "index_uninsureds_on_day_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "days", "months"
  add_foreign_key "days", "users"
  add_foreign_key "insureds", "days"
  add_foreign_key "months", "users"
  add_foreign_key "uninsureds", "days"
end
