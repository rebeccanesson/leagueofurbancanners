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

ActiveRecord::Schema.define(:version => 20130508214307) do

  create_table "blog_comments", :force => true do |t|
    t.integer  "post_id",                         :null => false
    t.string   "author",                          :null => false
    t.string   "email",                           :null => false
    t.text     "content"
    t.boolean  "is_published", :default => false, :null => false
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "blog_comments", ["post_id", "created_at"], :name => "index_blog_comments_on_post_id_and_created_at"
  add_index "blog_comments", ["post_id", "is_published", "created_at"], :name => "index_blog_comments_on_post_published_created"

  create_table "blog_posts", :force => true do |t|
    t.string   "title",                                          :null => false
    t.string   "slug",                                           :null => false
    t.text     "content"
    t.string   "excerpt",      :limit => 1024
    t.string   "author"
    t.integer  "year",         :limit => 4,                      :null => false
    t.integer  "month",        :limit => 2,                      :null => false
    t.boolean  "is_published",                 :default => true, :null => false
    t.datetime "published_at",                                   :null => false
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
  end

  add_index "blog_posts", ["created_at"], :name => "index_blog_posts_on_created_at"
  add_index "blog_posts", ["is_published", "created_at"], :name => "index_blog_posts_on_is_published_and_created_at"
  add_index "blog_posts", ["is_published", "year", "month", "slug"], :name => "index_blog_posts_on_published_year_month_slug"

  create_table "blog_taggings", :force => true do |t|
    t.integer "post_id", :null => false
    t.integer "tag_id",  :null => false
  end

  add_index "blog_taggings", ["post_id", "tag_id"], :name => "index_blog_taggings_on_post_tag", :unique => true

  create_table "blog_tags", :force => true do |t|
    t.string  "name",                              :null => false
    t.boolean "is_category",    :default => false, :null => false
    t.integer "taggings_count", :default => 0,     :null => false
  end

  add_index "blog_tags", ["name", "taggings_count"], :name => "index_blog_tags_on_name_and_taggings_count", :unique => true
  add_index "blog_tags", ["taggings_count"], :name => "index_blog_tags_on_taggings_count"

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

  create_table "cms_blocks", :force => true do |t|
    t.integer  "page_id",    :null => false
    t.string   "identifier", :null => false
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "cms_blocks", ["page_id", "identifier"], :name => "index_cms_blocks_on_page_id_and_identifier"

  create_table "cms_categories", :force => true do |t|
    t.integer "site_id",          :null => false
    t.string  "label",            :null => false
    t.string  "categorized_type", :null => false
  end

  add_index "cms_categories", ["site_id", "categorized_type", "label"], :name => "index_cms_categories_on_site_id_and_categorized_type_and_label", :unique => true

  create_table "cms_categorizations", :force => true do |t|
    t.integer "category_id",      :null => false
    t.string  "categorized_type", :null => false
    t.integer "categorized_id",   :null => false
  end

  add_index "cms_categorizations", ["category_id", "categorized_type", "categorized_id"], :name => "index_cms_categorizations_on_cat_id_and_catd_type_and_catd_id", :unique => true

  create_table "cms_files", :force => true do |t|
    t.integer  "site_id",                                          :null => false
    t.integer  "block_id"
    t.string   "label",                                            :null => false
    t.string   "file_file_name",                                   :null => false
    t.string   "file_content_type",                                :null => false
    t.integer  "file_file_size",                                   :null => false
    t.string   "description",       :limit => 2048
    t.integer  "position",                          :default => 0, :null => false
    t.datetime "created_at",                                       :null => false
    t.datetime "updated_at",                                       :null => false
  end

  add_index "cms_files", ["site_id", "block_id"], :name => "index_cms_files_on_site_id_and_block_id"
  add_index "cms_files", ["site_id", "file_file_name"], :name => "index_cms_files_on_site_id_and_file_file_name"
  add_index "cms_files", ["site_id", "label"], :name => "index_cms_files_on_site_id_and_label"
  add_index "cms_files", ["site_id", "position"], :name => "index_cms_files_on_site_id_and_position"

  create_table "cms_layouts", :force => true do |t|
    t.integer  "site_id",                                           :null => false
    t.integer  "parent_id"
    t.string   "app_layout"
    t.string   "label",                                             :null => false
    t.string   "identifier",                                        :null => false
    t.text     "content",    :limit => 16777215
    t.text     "css",        :limit => 16777215
    t.text     "js",         :limit => 16777215
    t.integer  "position",                       :default => 0,     :null => false
    t.boolean  "is_shared",                      :default => false, :null => false
    t.datetime "created_at",                                        :null => false
    t.datetime "updated_at",                                        :null => false
  end

  add_index "cms_layouts", ["parent_id", "position"], :name => "index_cms_layouts_on_parent_id_and_position"
  add_index "cms_layouts", ["site_id", "identifier"], :name => "index_cms_layouts_on_site_id_and_identifier", :unique => true

  create_table "cms_pages", :force => true do |t|
    t.integer  "site_id",                                               :null => false
    t.integer  "layout_id"
    t.integer  "parent_id"
    t.integer  "target_page_id"
    t.string   "label",                                                 :null => false
    t.string   "slug"
    t.string   "full_path",                                             :null => false
    t.text     "content",        :limit => 16777215
    t.integer  "position",                           :default => 0,     :null => false
    t.integer  "children_count",                     :default => 0,     :null => false
    t.boolean  "is_published",                       :default => true,  :null => false
    t.boolean  "is_shared",                          :default => false, :null => false
    t.datetime "created_at",                                            :null => false
    t.datetime "updated_at",                                            :null => false
  end

  add_index "cms_pages", ["parent_id", "position"], :name => "index_cms_pages_on_parent_id_and_position"
  add_index "cms_pages", ["site_id", "full_path"], :name => "index_cms_pages_on_site_id_and_full_path"

  create_table "cms_revisions", :force => true do |t|
    t.string   "record_type",                     :null => false
    t.integer  "record_id",                       :null => false
    t.text     "data",        :limit => 16777215
    t.datetime "created_at"
  end

  add_index "cms_revisions", ["record_type", "record_id", "created_at"], :name => "index_cms_revisions_on_record_type_and_record_id_and_created_at"

  create_table "cms_sites", :force => true do |t|
    t.string  "label",                          :null => false
    t.string  "identifier",                     :null => false
    t.string  "hostname",                       :null => false
    t.string  "path"
    t.string  "locale",      :default => "en",  :null => false
    t.boolean "is_mirrored", :default => false, :null => false
  end

  add_index "cms_sites", ["hostname"], :name => "index_cms_sites_on_hostname"
  add_index "cms_sites", ["is_mirrored"], :name => "index_cms_sites_on_is_mirrored"

  create_table "cms_snippets", :force => true do |t|
    t.integer  "site_id",                                           :null => false
    t.string   "label",                                             :null => false
    t.string   "identifier",                                        :null => false
    t.text     "content",    :limit => 16777215
    t.integer  "position",                       :default => 0,     :null => false
    t.boolean  "is_shared",                      :default => false, :null => false
    t.datetime "created_at",                                        :null => false
    t.datetime "updated_at",                                        :null => false
  end

  add_index "cms_snippets", ["site_id", "identifier"], :name => "index_cms_snippets_on_site_id_and_identifier", :unique => true
  add_index "cms_snippets", ["site_id", "position"], :name => "index_cms_snippets_on_site_id_and_position"

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
