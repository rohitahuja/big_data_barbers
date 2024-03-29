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

ActiveRecord::Schema.define(version: 20150906012823) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.integer  "status",                default: 0
    t.datetime "date_and_time"
    t.integer  "length"
    t.string   "customer_name"
    t.string   "customer_phone_number"
    t.integer  "schedule_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_index "appointments", ["schedule_id"], name: "index_appointments_on_schedule_id", using: :btree

  create_table "availabilities", force: :cascade do |t|
    t.integer  "day_of_week"
    t.time     "start_time"
    t.time     "end_time"
    t.integer  "schedule_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "availabilities", ["schedule_id"], name: "index_availabilities_on_schedule_id", using: :btree

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "posts", force: :cascade do |t|
    t.string   "image"
    t.integer  "professional_profile_id"
    t.integer  "service_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "posts", ["professional_profile_id"], name: "index_posts_on_professional_profile_id", using: :btree
  add_index "posts", ["service_id"], name: "index_posts_on_service_id", using: :btree

  create_table "professional_profiles", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.text     "bio"
    t.string   "image"
    t.integer  "professional_id"
    t.integer  "professional_profile_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "professional_profiles", ["professional_id"], name: "index_professional_profiles_on_professional_id", using: :btree
  add_index "professional_profiles", ["professional_profile_id"], name: "index_professional_profiles_on_professional_profile_id", using: :btree

  create_table "professionals", force: :cascade do |t|
    t.string   "provider",               default: "email", null: false
    t.string   "uid",                    default: "",      null: false
    t.string   "email",                  default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "shop_id"
    t.text     "tokens"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  add_index "professionals", ["email"], name: "index_professionals_on_email", unique: true, using: :btree
  add_index "professionals", ["reset_password_token"], name: "index_professionals_on_reset_password_token", unique: true, using: :btree
  add_index "professionals", ["shop_id"], name: "index_professionals_on_shop_id", using: :btree
  add_index "professionals", ["uid", "provider"], name: "index_professionals_on_uid_and_provider", unique: true, using: :btree

  create_table "schedules", force: :cascade do |t|
    t.integer  "professional_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "schedules", ["professional_id"], name: "index_schedules_on_professional_id", using: :btree

  create_table "service_details", force: :cascade do |t|
    t.integer  "duration"
    t.integer  "price"
    t.integer  "service_id"
    t.integer  "professional_id"
    t.integer  "shop_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "service_details", ["professional_id"], name: "index_service_details_on_professional_id", using: :btree
  add_index "service_details", ["service_id"], name: "index_service_details_on_service_id", using: :btree
  add_index "service_details", ["shop_id"], name: "index_service_details_on_shop_id", using: :btree

  create_table "services", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shop_profiles", force: :cascade do |t|
    t.string   "name"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "city"
    t.string   "zip"
    t.string   "state"
    t.string   "country"
    t.string   "image"
    t.integer  "shop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "shop_profiles", ["shop_id"], name: "index_shop_profiles_on_shop_id", using: :btree

  create_table "shops", force: :cascade do |t|
    t.string   "provider",                            null: false
    t.string   "uid",                    default: "", null: false
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.text     "tokens"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "shops", ["email"], name: "index_shops_on_email", using: :btree
  add_index "shops", ["reset_password_token"], name: "index_shops_on_reset_password_token", unique: true, using: :btree
  add_index "shops", ["uid", "provider"], name: "index_shops_on_uid_and_provider", unique: true, using: :btree

end
