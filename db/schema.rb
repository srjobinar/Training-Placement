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

ActiveRecord::Schema.define(version: 20160527133428) do

  create_table "branchcompanies", force: :cascade do |t|
    t.integer "branch_id"
    t.integer "company_id"
  end

  add_index "branchcompanies", ["branch_id"], name: "index_branchcompanies_on_branch_id"
  add_index "branchcompanies", ["company_id"], name: "index_branchcompanies_on_company_id"

  create_table "branches", force: :cascade do |t|
    t.string "name"
    t.string "code"
  end

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.integer  "package"
    t.date     "last_date"
    t.date     "exam_date"
    t.float    "cutoff"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "registers", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "registers", ["company_id"], name: "index_registers_on_company_id"
  add_index "registers", ["user_id"], name: "index_registers_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "roll"
    t.integer  "branch_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
  end

  add_index "users", ["branch_id"], name: "index_users_on_branch_id"

end
