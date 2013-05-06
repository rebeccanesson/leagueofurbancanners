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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130502193905) do

  create_table "canning_sessions", :force => true do |t|
    t.integer  "harvest_id"
    t.integer  "leader_id"
    t.datetime "date"
    t.integer  "amount_canned"
    t.integer  "pints_canned"
    t.text     "notes"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "cannings", :force => true do |t|
    t.integer  "canning_session_id"
    t.integer  "canner_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "hours"
  end

  create_table "fruit_trees", :force => true do |t|
    t.integer  "site_id"
    t.integer  "fruit_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "season_start_month"
    t.integer  "season_start_day"
    t.string   "season_end_month"
    t.integer  "season_end_day"
    t.boolean  "pruning_candidate"
    t.boolean  "pruning_permission"
    t.boolean  "gmaps"
  end

  create_table "fruits", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "season_start_month"
    t.integer  "season_start_day"
    t.string   "season_end_month"
    t.integer  "season_end_day"
  end

  create_table "harvestings", :force => true do |t|
    t.integer  "harvest_id"
    t.integer  "harvester_id"
    t.integer  "hours"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "harvests", :force => true do |t|
    t.text     "description"
    t.integer  "harvesters_needed"
    t.integer  "canners_needed"
    t.datetime "date"
    t.integer  "fruit_tree_id"
    t.integer  "leader_id"
    t.integer  "amount_harvested"
    t.text     "notes"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "people", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "email"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "prunings", :force => true do |t|
    t.integer  "fruit_tree_id"
    t.datetime "date"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "leader_id"
  end

  create_table "sites", :force => true do |t|
    t.string   "street"
    t.string   "city"
    t.string   "zipcode"
    t.string   "latitude"
    t.string   "longitude"
    t.integer  "owner_id"
    t.integer  "secondary_owner_id"
    t.integer  "lurc_contact_id"
    t.text     "note"
    t.string   "status"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.float    "lat"
    t.float    "lon"
    t.boolean  "gmaps"
    t.integer  "street_number"
    t.string   "street_name"
    t.boolean  "owner_contacted",    :default => false
  end

  create_table "status_checks", :force => true do |t|
    t.integer  "fruit_tree_id"
    t.datetime "date"
    t.string   "status"
    t.text     "notes"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "role"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
