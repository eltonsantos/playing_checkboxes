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

ActiveRecord::Schema.define(version: 20160422182946) do

  create_table "authorizations", force: :cascade do |t|
    t.integer  "employee_id"
    t.string   "contract_number"
    t.integer  "situation"
    t.decimal  "total_value"
    t.decimal  "parcel_value"
    t.integer  "qtd_parcel"
    t.decimal  "value_solve"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "employees", force: :cascade do |t|
    t.integer  "person_id"
    t.string   "register"
    t.decimal  "salary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "historic_refinancings", force: :cascade do |t|
    t.integer  "authorization_origin_id"
    t.integer  "refinancing_id"
    t.integer  "authorization_new_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "people", force: :cascade do |t|
    t.string   "name"
    t.string   "cpf"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "refinancings", force: :cascade do |t|
    t.integer  "employee_id"
    t.integer  "authorization_id"
    t.string   "contract_number"
    t.integer  "situation"
    t.decimal  "total_value"
    t.decimal  "parcel_value"
    t.integer  "qtd_parcel"
    t.date     "refinancing_date"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

end
