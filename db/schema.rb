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

ActiveRecord::Schema.define(version: 20180222140054) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace",     limit: 255
    t.text     "body",          limit: 65535
    t.integer  "resource_id",   limit: 4
    t.string   "resource_type", limit: 255
    t.integer  "author_id",     limit: 4
    t.string   "author_type",   limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "ad_campaigns", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.string   "objective",     limit: 255
    t.string   "status",        limit: 255
    t.string   "facebook_id",   limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "ad_request_id", limit: 4
  end

  create_table "ad_creatives", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.string   "image_hash",    limit: 255
    t.string   "link",          limit: 255
    t.string   "message",       limit: 255
    t.string   "facebook_id",   limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "ad_request_id", limit: 4
  end

  create_table "ad_images", force: :cascade do |t|
    t.integer  "ad_request_id", limit: 4
    t.string   "facebook_hash", limit: 255
    t.string   "facebook_url",  limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "ad_objects", force: :cascade do |t|
    t.integer  "ad_request_id",  limit: 4
    t.string   "name",           limit: 255
    t.string   "status",         limit: 255
    t.integer  "adset_id",       limit: 4
    t.integer  "ad_creative_id", limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "ad_requests", force: :cascade do |t|
    t.string   "broker_uuid",            limit: 255
    t.text     "response",               limit: 65535
    t.string   "name",                   limit: 255
    t.text     "location_details",       limit: 65535
    t.text     "image_urls",             limit: 65535
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "email",                  limit: 255,   default: "", null: false
    t.string   "encrypted_password",     limit: 255,   default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "access_token",           limit: 255
  end

  add_index "ad_requests", ["email"], name: "index_ad_requests_on_email", unique: true, using: :btree
  add_index "ad_requests", ["reset_password_token"], name: "index_ad_requests_on_reset_password_token", unique: true, using: :btree

  create_table "ad_sets", force: :cascade do |t|
    t.integer  "ad_request_id",     limit: 4
    t.string   "name",              limit: 255
    t.integer  "lifetime_budget",   limit: 4
    t.string   "optimization_goal", limit: 255
    t.string   "billing_event",     limit: 255
    t.text     "targeting",         limit: 65535
    t.integer  "ad_campaign_id",    limit: 4
    t.string   "status",            limit: 255
    t.integer  "bid_amount",        limit: 4
    t.datetime "end_time"
    t.text     "promoted_object",   limit: 65535
    t.string   "facebook_id",       limit: 255
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

end
