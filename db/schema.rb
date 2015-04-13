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

ActiveRecord::Schema.define(version: 20150413185920) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "certs", force: :cascade do |t|
    t.string   "title"
    t.date     "start_date"
    t.date     "expire_date"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "profile_id"
  end

  add_index "certs", ["profile_id"], name: "index_certs_on_profile_id", using: :btree

  create_table "educations", force: :cascade do |t|
    t.string   "school"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "subject"
    t.text     "description"
    t.string   "degree"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "profile_id"
  end

  add_index "educations", ["profile_id"], name: "index_educations_on_profile_id", using: :btree

  create_table "jobs", force: :cascade do |t|
    t.string   "company"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "position"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "profile_id"
  end

  add_index "jobs", ["profile_id"], name: "index_jobs_on_profile_id", using: :btree

  create_table "profiles", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.string   "twitter"
    t.date     "birthdate"
    t.string   "phone"
    t.string   "mobile_phone"
    t.string   "gender"
    t.string   "secondary_email"
    t.text     "bio"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "user_id"
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "twitter"
    t.date     "birthdate"
    t.string   "phone"
    t.string   "mobile_phone"
    t.string   "gender"
    t.string   "secondary_email"
    t.text     "bio"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "certs", "profiles"
  add_foreign_key "certs", "profiles"
  add_foreign_key "educations", "profiles"
  add_foreign_key "educations", "profiles"
  add_foreign_key "jobs", "profiles"
  add_foreign_key "profiles", "users"
  add_foreign_key "profiles", "users"
end
