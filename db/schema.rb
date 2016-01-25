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

ActiveRecord::Schema.define(version: 20160125065321) do

  create_table "event_registrations", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "profile_id"
    t.boolean  "paid"
    t.decimal  "amount"
    t.string   "currency"
    t.datetime "payment_date"
    t.string   "payment_method"
    t.string   "transaction_id"
    t.integer  "race_number"
    t.string   "race_category"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "event_registrations", ["event_id"], name: "index_event_registrations_on_event_id"
  add_index "event_registrations", ["profile_id"], name: "index_event_registrations_on_profile_id"

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "distance"
    t.integer  "local_price"
    t.integer  "foreign_price"
    t.boolean  "registration_open"
    t.integer  "trail_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "events", ["trail_id"], name: "index_events_on_trail_id"

  create_table "profiles", force: :cascade do |t|
    t.string   "first_name"
    t.string   "family_name"
    t.date     "date_of_birth"
    t.string   "email"
    t.string   "mobile"
    t.string   "gender"
    t.string   "nationality"
    t.string   "country_of_residence"
    t.string   "passport_number"
    t.string   "tshirt_size"
    t.string   "emergency_contact_name"
    t.string   "emergency_contact_phone"
    t.boolean  "accepted_terms"
    t.boolean  "member_of_rta"
    t.integer  "rta_number"
    t.integer  "user_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "profiles", ["rta_number"], name: "index_profiles_on_rta_number"
  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id"

  create_table "testimonial_translations", force: :cascade do |t|
    t.integer  "testimonial_id", null: false
    t.string   "locale",         null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "author"
    t.string   "comment"
  end

  add_index "testimonial_translations", ["locale"], name: "index_testimonial_translations_on_locale"
  add_index "testimonial_translations", ["testimonial_id"], name: "index_testimonial_translations_on_testimonial_id"

  create_table "testimonials", force: :cascade do |t|
    t.string   "author"
    t.string   "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trails", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "location"
    t.datetime "date"
    t.string   "external_link"
    t.boolean  "register_online"
    t.string   "organiser"
    t.string   "course"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
