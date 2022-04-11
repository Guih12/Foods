# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_04_11_181105) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "combo_items", force: :cascade do |t|
    t.bigint "combo_id", null: false
    t.bigint "product_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["combo_id"], name: "index_combo_items_on_combo_id"
    t.index ["product_id"], name: "index_combo_items_on_product_id"
  end

  create_table "combos", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.float "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "place_order_combo_items", force: :cascade do |t|
    t.bigint "place_order_id", null: false
    t.bigint "combo_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["combo_id"], name: "index_place_order_combo_items_on_combo_id"
    t.index ["place_order_id"], name: "index_place_order_combo_items_on_place_order_id"
  end

  create_table "place_order_product_items", force: :cascade do |t|
    t.bigint "place_order_id", null: false
    t.bigint "product_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["place_order_id"], name: "index_place_order_product_items_on_place_order_id"
    t.index ["product_id"], name: "index_place_order_product_items_on_product_id"
  end

  create_table "place_orders", force: :cascade do |t|
    t.string "name_user"
    t.string "cpf_user"
    t.date "data"
    t.boolean "status"
    t.float "price"
    t.string "code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "price_with_discount"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "type_product"
    t.decimal "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "restaurant_id"
    t.index ["restaurant_id"], name: "index_products_on_restaurant_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name"
    t.string "number_phone"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_restaurants_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name"
    t.string "lastname"
    t.integer "age"
    t.string "email"
    t.json "tokens"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  add_foreign_key "combo_items", "combos"
  add_foreign_key "combo_items", "products"
  add_foreign_key "place_order_combo_items", "combos"
  add_foreign_key "place_order_combo_items", "place_orders"
  add_foreign_key "place_order_product_items", "place_orders"
  add_foreign_key "place_order_product_items", "products"
  add_foreign_key "restaurants", "users"
end
