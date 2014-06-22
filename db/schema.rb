# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140622204344) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "security_transgressions", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spots", force: true do |t|
    t.string   "name"
    t.string   "tag"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "created_by"
    t.spatial  "lnglat",      limit: {:srid=>4326, :type=>"point", :geographic=>true}
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_approved",                                                          default: false
  end

  create_table "user_spots", force: true do |t|
    t.integer  "user_id"
    t.integer  "spot_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_spots", ["spot_id"], :name => "index_user_spots_on_spot_id"
  add_index "user_spots", ["user_id"], :name => "index_user_spots_on_user_id"

  create_table "users", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.string   "name"
    t.boolean  "is_admin",        default: false
  end

end
