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

ActiveRecord::Schema.define(:version => 20111215131838) do

  create_table "active_admin_comments", :force => true do |t|
    t.integer  "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "favorited_tweets", :force => true do |t|
    t.string   "tweet_id"
    t.string   "user_name"
    t.string   "user_screen_name"
    t.string   "user_url"
    t.string   "user_photo"
    t.text     "body"
    t.datetime "created_at"
  end

  create_table "histories", :force => true do |t|
    t.string   "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month"
    t.integer  "year"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "histories", ["item", "table", "month", "year"], :name => "index_histories_on_item_and_table_and_month_and_year"

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.string   "tagline"
    t.text     "body"
    t.text     "rendered_body"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cached_slug"
    t.string   "picture"
    t.boolean  "published"
  end

  add_index "posts", ["author_id"], :name => "index_posts_on_author_id"
  add_index "posts", ["tagline"], :name => "index_posts_on_tagline"
  add_index "posts", ["title"], :name => "index_posts_on_title"

  create_table "projects", :force => true do |t|
    t.string   "title"
    t.string   "quote"
    t.string   "client_name"
    t.string   "category"
    t.string   "cached_slug"
    t.boolean  "promoted"
    t.text     "description"
    t.text     "extended_description"
    t.string   "url"
    t.integer  "downloads"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "rubygem"
    t.text     "rendered_description"
    t.text     "rendered_extended_description"
    t.boolean  "published"
    t.string   "screenshot"
  end

  add_index "projects", ["cached_slug"], :name => "index_projects_on_cached_slug"
  add_index "projects", ["category"], :name => "index_projects_on_category"
  add_index "projects", ["created_at"], :name => "index_projects_on_created_at"
  add_index "projects", ["promoted"], :name => "index_projects_on_promoted"
  add_index "projects", ["rendered_description"], :name => "index_projects_on_rendered_description"
  add_index "projects", ["rendered_extended_description"], :name => "index_projects_on_rendered_extended_description"
  add_index "projects", ["title"], :name => "index_projects_on_title"
  add_index "projects", ["updated_at"], :name => "index_projects_on_updated_at"

  create_table "screenshots", :force => true do |t|
    t.string   "file"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "screenshots", ["project_id"], :name => "index_screenshots_on_project_id"

  create_table "slugs", :force => true do |t|
    t.string   "name"
    t.integer  "sluggable_id"
    t.integer  "sequence",                     :default => 1, :null => false
    t.string   "sluggable_type", :limit => 40
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "slugs", ["name", "sluggable_type", "sequence", "scope"], :name => "index_slugs_on_n_s_s_and_s", :unique => true
  add_index "slugs", ["sluggable_id"], :name => "index_slugs_on_sluggable_id"

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.string   "position"
    t.string   "twitter"
    t.string   "github"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "api_token"
    t.string   "description"
    t.string   "homepage"
    t.string   "cached_slug"
  end

  add_index "users", ["cached_slug"], :name => "index_users_on_cached_slug"
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
