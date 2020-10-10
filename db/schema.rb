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

ActiveRecord::Schema.define(version: 2018_02_23_230457) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "post_id", null: false
    t.text "message"
    t.string "fid", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fid"], name: "index_comments_on_fid", unique: true
  end

  create_table "post_tags", force: :cascade do |t|
    t.integer "post_id", null: false
    t.integer "tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id", "tag_id"], name: "index_post_tags_on_post_id_and_tag_id", unique: true
  end

  create_table "posts", force: :cascade do |t|
    t.text "message"
    t.text "link"
    t.string "type", null: false
    t.text "permalink_url", null: false
    t.string "fid", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.text "picture"
    t.string "name"
    t.integer "comments_count", default: 0, null: false
    t.integer "reactions_count", default: 0, null: false
    t.index ["fid"], name: "index_posts_on_fid", unique: true
    t.index ["permalink_url"], name: "index_posts_on_permalink_url", unique: true
  end

  create_table "reactions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "post_id", null: false
    t.string "type", null: false
    t.string "fid", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fid"], name: "index_reactions_on_fid", unique: true
  end

  create_table "tags", force: :cascade do |t|
    t.string "title"
    t.integer "posts_count", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["title"], name: "index_tags_on_title", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "fid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "posts_count", default: 0, null: false
    t.integer "comments_count", default: 0, null: false
    t.integer "reactions_count", default: 0, null: false
  end

end
