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

ActiveRecord::Schema.define(version: 2021_02_16_181030) do

  create_table "multilingual_strings", force: :cascade do |t|
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_type", "record_id"], name: "index_multilingual_strings_on_record"
  end

  create_table "multilingual_translations", force: :cascade do |t|
    t.integer "multilingual_string_id", null: false
    t.string "locale"
    t.string "text"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["multilingual_string_id"], name: "index_multilingual_translations_on_multilingual_string_id"
  end

  add_foreign_key "multilingual_translations", "multilingual_strings"
end
