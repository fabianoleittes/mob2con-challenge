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

ActiveRecord::Schema.define(version: 2020_10_12_044751) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "citext"
  enable_extension "plpgsql"

  create_table "retail_chains", force: :cascade do |t|
    t.citext "name", default: "", null: false
    t.string "cnpj", default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_retail_chains_on_name"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "email", default: "", null: false
    t.string "password_digest", default: "", null: false
    t.boolean "admin", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "retail_chain_id"
    t.index ["admin"], name: "index_users_on_admin"
    t.index ["email"], name: "index_users_on_email"
    t.index ["retail_chain_id"], name: "index_users_on_retail_chain_id"
  end

  create_table "visitors", force: :cascade do |t|
    t.citext "name", default: "", null: false
    t.bigint "retail_chain_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_visitors_on_name"
    t.index ["retail_chain_id"], name: "index_visitors_on_retail_chain_id"
  end

  add_foreign_key "users", "retail_chains"
  add_foreign_key "visitors", "retail_chains"
end
