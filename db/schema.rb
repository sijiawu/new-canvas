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

ActiveRecord::Schema.define(version: 0) do

  create_table "authors", force: :cascade do |t|
    t.text "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "books", force: :cascade do |t|
    t.text "title"
    t.integer "author_id"
    t.text "summary"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text "cover_url"
    t.index ["author_id"], name: "index_books_on_author_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "content"
    t.text "creator"
    t.integer "book_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["book_id"], name: "index_reviews_on_book_id"
  end

  create_table "users", force: :cascade do |t|
    t.text "username"
    t.text "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text "password_digest"
  end

end
