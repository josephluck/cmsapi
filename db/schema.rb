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

ActiveRecord::Schema.define(version: 20160523132123) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
  end

  add_index "companies", ["email"], name: "index_companies_on_email", unique: true, using: :btree
  add_index "companies", ["reset_password_token"], name: "index_companies_on_reset_password_token", unique: true, using: :btree

  create_table "domains", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
    t.string   "domain"
  end

  add_index "domains", ["company_id"], name: "index_domains_on_company_id", using: :btree

  create_table "field_attributes", force: true do |t|
    t.integer  "field_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
    t.integer  "field_template_attribute_id"
    t.string   "value"
  end

  add_index "field_attributes", ["company_id"], name: "index_field_attributes_on_company_id", using: :btree
  add_index "field_attributes", ["field_id"], name: "index_field_attributes_on_field_id", using: :btree
  add_index "field_attributes", ["field_template_attribute_id"], name: "index_field_attributes_on_field_template_attribute_id", using: :btree

  create_table "field_template_attributes", force: true do |t|
    t.integer  "company_id"
    t.integer  "field_template_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "kind"
    t.json     "options"
  end

  add_index "field_template_attributes", ["company_id"], name: "index_field_template_attributes_on_company_id", using: :btree
  add_index "field_template_attributes", ["field_template_id"], name: "index_field_template_attributes_on_field_template_id", using: :btree

  create_table "field_templates", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.integer  "company_id"
    t.integer  "order"
  end

  add_index "field_templates", ["company_id"], name: "index_field_templates_on_company_id", using: :btree

  create_table "fields", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
    t.integer  "item_id"
  end

  add_index "fields", ["company_id"], name: "index_fields_on_company_id", using: :btree
  add_index "fields", ["item_id"], name: "index_fields_on_item_id", using: :btree

  create_table "items", force: true do |t|
    t.integer  "section_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
    t.string   "title"
    t.integer  "field_template_id"
    t.integer  "order"
  end

  add_index "items", ["company_id"], name: "index_items_on_company_id", using: :btree
  add_index "items", ["field_template_id"], name: "index_items_on_field_template_id", using: :btree
  add_index "items", ["section_id"], name: "index_items_on_section_id", using: :btree

  create_table "pages", force: true do |t|
    t.integer  "site_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.integer  "company_id"
    t.integer  "order"
  end

  add_index "pages", ["company_id"], name: "index_pages_on_company_id", using: :btree
  add_index "pages", ["site_id"], name: "index_pages_on_site_id", using: :btree

  create_table "projects", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
  end

  add_index "projects", ["company_id"], name: "index_projects_on_company_id", using: :btree

  create_table "sections", force: true do |t|
    t.integer  "page_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
    t.string   "title"
    t.integer  "order"
  end

  add_index "sections", ["company_id"], name: "index_sections_on_company_id", using: :btree
  add_index "sections", ["page_id"], name: "index_sections_on_page_id", using: :btree

  create_table "sites", force: true do |t|
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.integer  "order"
  end

  add_index "sites", ["company_id"], name: "index_sites_on_company_id", using: :btree

  create_table "team_members", force: true do |t|
    t.string   "email"
    t.string   "company_name"
    t.integer  "company_id"
    t.boolean  "admin_user",   default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_projects", force: true do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "auth_token",             default: ""
    t.boolean  "admin_user",             default: false
    t.string   "company_name"
    t.integer  "company_id"
    t.boolean  "api_consumer",           default: false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "users", ["auth_token"], name: "index_users_on_auth_token", unique: true, using: :btree
  add_index "users", ["company_id"], name: "index_users_on_company_id", using: :btree
  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
