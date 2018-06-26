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

ActiveRecord::Schema.define(version: 2018_06_21_120117) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "line_items", force: :cascade do |t|
    t.integer "product_id"
    t.integer "cart_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quantity", default: 1
    t.bigint "order_id"
    t.index ["order_id"], name: "index_line_items_on_order_id"
  end

  create_table "loais", force: :cascade do |t|
    t.string "loaihang"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "nguoidungs", force: :cascade do |t|
    t.boolean "admin"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_nguoidungs_on_email", unique: true
    t.index ["reset_password_token"], name: "index_nguoidungs_on_reset_password_token", unique: true
  end

  create_table "orders", force: :cascade do |t|
    t.string "name"
    t.text "diachi"
    t.string "email"
    t.decimal "sdt"
    t.text "ghichu"
    t.integer "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "trang_thai_don_hang"
  end

  create_table "products", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "image_url"
    t.decimal "price", precision: 20, scale: 2
    t.bigint "loai_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.index ["loai_id"], name: "index_products_on_loai_id"
  end

  add_foreign_key "line_items", "orders"
  add_foreign_key "products", "loais"
end
