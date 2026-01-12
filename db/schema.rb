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

ActiveRecord::Schema[8.0].define(version: 2026_01_12_050257) do
  create_table "applications", force: :cascade do |t|
    t.integer "icon_id"
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

  create_table "icon_variants", force: :cascade do |t|
    t.integer "icon_id", null: false
    t.integer "format", null: false
    t.integer "theme", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["icon_id", "format", "theme"], name: "index_icon_variants_on_icon_id_and_format_and_theme", unique: true
    t.index ["icon_id"], name: "index_icon_variants_on_icon_id"
  end

  create_table "icons", force: :cascade do |t|
    t.string "slug", null: false
    t.string "name", null: false
    t.string "tags"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_icons_on_slug", unique: true
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

  create_table "themes", force: :cascade do |t|
    t.string "token", null: false
    t.string "name", null: false
    t.boolean "custom", default: true, null: false
    t.boolean "enabled", default: true, null: false
    t.integer "color_scheme", default: 0, null: false
    t.string "color_base_100", default: "oklch(20.84% 0.008 17.911)", null: false
    t.string "color_base_200", default: "oklch(18.522% 0.007 17.911)", null: false
    t.string "color_base_300", default: "oklch(16.203% 0.007 17.911)", null: false
    t.string "color_base_content", default: "oklch(83.768% 0.001 17.911)", null: false
    t.string "color_primary", default: "oklch(68.628% 0.185 148.958)", null: false
    t.string "color_primary_content", default: "oklch(0% 0 0)", null: false
    t.string "color_secondary", default: "oklch(69.776% 0.135 168.327)", null: false
    t.string "color_secondary_content", default: "oklch(13.955% 0.027 168.327)", null: false
    t.string "color_accent", default: "oklch(70.628% 0.119 185.713)", null: false
    t.string "color_accent_content", default: "oklch(14.125% 0.023 185.713)", null: false
    t.string "color_neutral", default: "oklch(30.698% 0.039 171.364)", null: false
    t.string "color_neutral_content", default: "oklch(86.139% 0.007 171.364)", null: false
    t.string "color_info", default: "oklch(72.06% 0.191 231.6)", null: false
    t.string "color_info_content", default: "oklch(0% 0 0)", null: false
    t.string "color_success", default: "oklch(64.8% 0.15 160)", null: false
    t.string "color_success_content", default: "oklch(0% 0 0)", null: false
    t.string "color_warning", default: "oklch(84.71% 0.199 83.87)", null: false
    t.string "color_warning_content", default: "oklch(0% 0 0)", null: false
    t.string "color_error", default: "oklch(71.76% 0.221 22.18)", null: false
    t.string "color_error_content", default: "oklch(0% 0 0)", null: false
    t.float "radius_selector", default: 1.0, null: false
    t.float "radius_field", default: 2.0, null: false
    t.float "radius_box", default: 1.0, null: false
    t.float "size_selector", default: 0.25, null: false
    t.float "size_field", default: 0.25, null: false
    t.float "border", default: 1.0, null: false
    t.boolean "depth", default: false, null: false
    t.boolean "noise", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["token"], name: "index_themes_on_token", unique: true
  end

  add_foreign_key "applications", "icons"
  add_foreign_key "bookmarks", "categories"
  add_foreign_key "icon_variants", "icons"
end
