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

ActiveRecord::Schema.define(version: 0) do

  create_table "category", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "name"
  end

  create_table "product", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "name"
    t.string "url_image"
    t.float "price"
    t.integer "discount"
    t.integer "category"
    t.index ["category"], name: "product_category"
    t.index ["discount"], name: "product_discount"
    t.index ["name"], name: "product_name"
    t.index ["price"], name: "product_price"
  end

  add_foreign_key "product", "category", column: "category", name: "product_ibfk_1"
end
