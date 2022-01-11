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

ActiveRecord::Schema.define(version: 2022_01_11_021920) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cepa_vinos", force: :cascade do |t|
    t.bigint "cepa_id"
    t.bigint "vino_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "percentage"
    t.index ["cepa_id"], name: "index_cepa_vinos_on_cepa_id"
    t.index ["vino_id"], name: "index_cepa_vinos_on_vino_id"
  end

  create_table "cepas", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "aviable"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "editor"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vinos", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "cepa_vinos", "cepas"
  add_foreign_key "cepa_vinos", "vinos"
end
