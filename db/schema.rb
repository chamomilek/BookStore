# frozen_string_literal: true

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

ActiveRecord::Schema[7.0].define(version: 20_220_329_125_227) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'books', force: :cascade do |t|
    t.string 'title'
    t.string 'description'
    t.string 'images'
    t.float 'price'
    t.integer 'pages'
    t.string 'language'
    t.float 'dimensions'
    t.datetime 'publication_date', precision: nil
    t.integer 'weight'
    t.bigint 'category_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['category_id'], name: 'index_books_on_category_id'
  end

  create_table 'carts', force: :cascade do |t|
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'categories', force: :cascade do |t|
    t.string 'genre'
    t.string 'image_url'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'line_items', force: :cascade do |t|
    t.bigint 'book_id', null: false
    t.integer 'cart_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'quantity', default: 1
    t.bigint 'order_id'
    t.index ['book_id'], name: 'index_line_items_on_book_id'
    t.index ['cart_id'], name: 'index_line_items_on_cart_id'
    t.index ['order_id'], name: 'index_line_items_on_order_id'
  end

  create_table 'orders', force: :cascade do |t|
    t.string 'name'
    t.text 'address'
    t.string 'email'
    t.integer 'pay_type'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  add_foreign_key 'books', 'categories'
  add_foreign_key 'line_items', 'books'
  add_foreign_key 'line_items', 'carts'
  add_foreign_key 'line_items', 'orders'
end
