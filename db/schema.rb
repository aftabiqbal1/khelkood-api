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

ActiveRecord::Schema[7.0].define(version: 2022_07_01_091527) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.datetime "date"
    t.string "time_slot"
    t.boolean "cancelled_status"
    t.boolean "paid_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "sports_complex_id"
    t.index ["sports_complex_id"], name: "index_bookings_on_sports_complex_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "cart_items", force: :cascade do |t|
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "product_id"
    t.index ["product_id"], name: "index_cart_items_on_product_id"
  end

  create_table "carts", force: :cascade do |t|
    t.float "sub_total"
    t.string "city"
    t.text "address"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "discounts", force: :cascade do |t|
    t.string "name"
    t.text "desc"
    t.string "promo_code"
    t.float "discount_percentage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_details", force: :cascade do |t|
    t.integer "quantity"
    t.boolean "payment_status"
    t.boolean "shipped_status"
    t.float "total_bill"
    t.boolean "cancelled_status"
    t.text "cancellation_reason"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "product_id"
    t.index ["product_id"], name: "index_order_details_on_product_id"
    t.index ["user_id"], name: "index_order_details_on_user_id"
  end

  create_table "product_reviews", force: :cascade do |t|
    t.string "rating"
    t.text "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "product_id"
    t.index ["product_id"], name: "index_product_reviews_on_product_id"
    t.index ["user_id"], name: "index_product_reviews_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "sku"
    t.string "size"
    t.string "category"
    t.float "price"
    t.integer "stock_quantity"
    t.string "gender_category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "discount_id"
    t.index ["discount_id"], name: "index_products_on_discount_id"
  end

  create_table "sports_complex_reviews", force: :cascade do |t|
    t.string "rating"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "sports_complex_id"
    t.index ["sports_complex_id"], name: "index_sports_complex_reviews_on_sports_complex_id"
  end

  create_table "sports_complexes", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.string "city"
    t.string "address"
    t.string "cost_hr"
    t.string "timing"
    t.boolean "snacks_availability"
    t.string "ground_type"
    t.integer "No_of_stadiums"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_sports_complexes_on_user_id"
  end

  create_table "stores", force: :cascade do |t|
    t.string "name"
    t.string "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "product_id"
    t.index ["product_id"], name: "index_stores_on_product_id"
    t.index ["user_id"], name: "index_stores_on_user_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "matches_played"
    t.integer "wins"
    t.integer "loses"
    t.integer "draw"
    t.float "win_average"
  end

  create_table "transaction_details", force: :cascade do |t|
    t.string "payment_mode"
    t.text "content"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "order_details_id"
    t.bigint "booking_id"
    t.index ["booking_id"], name: "index_transaction_details_on_booking_id"
    t.index ["order_details_id"], name: "index_transaction_details_on_order_details_id"
    t.index ["user_id"], name: "index_transaction_details_on_user_id"
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
    t.string "nickname"
    t.string "image"
    t.string "email"
    t.json "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "mobile_number"
    t.string "city"
    t.string "address"
    t.integer "role"
    t.boolean "active_status"
    t.bigint "team_id"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["team_id"], name: "index_users_on_team_id"
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  add_foreign_key "bookings", "sports_complexes"
  add_foreign_key "bookings", "users"
  add_foreign_key "cart_items", "products"
  add_foreign_key "carts", "users"
  add_foreign_key "order_details", "products"
  add_foreign_key "order_details", "users"
  add_foreign_key "product_reviews", "products"
  add_foreign_key "product_reviews", "users"
  add_foreign_key "products", "discounts"
  add_foreign_key "sports_complex_reviews", "sports_complexes"
  add_foreign_key "sports_complexes", "users"
  add_foreign_key "stores", "products"
  add_foreign_key "stores", "users"
  add_foreign_key "transaction_details", "bookings"
  add_foreign_key "transaction_details", "order_details", column: "order_details_id"
  add_foreign_key "transaction_details", "users"
  add_foreign_key "users", "teams"
end
