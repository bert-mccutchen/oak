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

ActiveRecord::Schema[8.0].define(version: 2025_09_02_162340) do
  create_table "applications", force: :cascade do |t|
    t.integer "icon_id", null: false
    t.string "token", null: false
    t.string "name", null: false
    t.string "description"
    t.string "url", null: false
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["icon_id"], name: "index_applications_on_icon_id"
    t.index ["position"], name: "index_applications_on_position"
    t.index ["token"], name: "index_applications_on_token", unique: true
  end

  create_table "bookmarks", force: :cascade do |t|
    t.integer "category_id", null: false
    t.string "token", null: false
    t.string "name", null: false
    t.string "url", null: false
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_bookmarks_on_category_id"
    t.index ["position"], name: "index_bookmarks_on_position"
    t.index ["token"], name: "index_bookmarks_on_token", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "token", null: false
    t.string "name", null: false
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["position"], name: "index_categories_on_position"
    t.index ["token"], name: "index_categories_on_token", unique: true
  end

  create_table "icons", force: :cascade do |t|
    t.string "slug", null: false
    t.string "name", null: false
    t.string "tags"
    t.integer "format", null: false
    t.integer "theme", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug", "format", "theme"], name: "index_icons_on_slug_and_format_and_theme", unique: true
  end

  create_table "quotes", force: :cascade do |t|
    t.string "token", null: false
    t.text "quote", null: false
    t.string "author", null: false
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["token"], name: "index_quotes_on_token", unique: true
  end

  create_table "settings", force: :cascade do |t|
    t.string "slug", null: false
    t.string "name", null: false
    t.string "description", null: false
    t.string "value"
    t.string "default"
    t.integer "value_type", null: false
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_settings_on_name", unique: true
    t.index ["slug"], name: "index_settings_on_slug", unique: true
  end

  add_foreign_key "applications", "icons"
  add_foreign_key "bookmarks", "categories"
end
