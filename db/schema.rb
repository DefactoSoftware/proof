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

ActiveRecord::Schema.define(version: 20151027135013) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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

  create_table "evidences", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "requirement_id"
    t.datetime "valid_until",                    null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "description"
    t.boolean  "approved",       default: false
  end

  add_index "evidences", ["requirement_id"], name: "index_evidences_on_requirement_id", using: :btree
  add_index "evidences", ["user_id"], name: "index_evidences_on_user_id", using: :btree

  create_table "proof", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "requirement_id"
    t.datetime "valid_until"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "proof", ["requirement_id"], name: "index_proof_on_requirement_id", using: :btree
  add_index "proof", ["user_id"], name: "index_proof_on_user_id", using: :btree

  create_table "requirements", force: :cascade do |t|
    t.string   "title",         null: false
    t.string   "description"
    t.integer  "within_months"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                                            null: false
    t.string   "encrypted_password",               default: "",    null: false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "name"
    t.boolean  "manager",                          default: false
    t.string   "remember_token",       limit: 128
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
