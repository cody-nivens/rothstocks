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

ActiveRecord::Schema.define(version: 20180527205154) do

  create_table "industries", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.bigint "sector_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sector_id"], name: "index_industries_on_sector_id"
  end

  create_table "roles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["name"], name: "index_roles_on_name"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "sectors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_sectors_on_name", unique: true
  end

  create_table "stocks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "symbol"
    t.string "name"
    t.bigint "industry_id"
    t.bigint "sector_id"
    t.integer "ccc_seq"
    t.float "price", limit: 24
    t.integer "yield_years"
    t.float "div_yield", limit: 24
    t.float "old_rate", limit: 24
    t.float "new_rate", limit: 24
    t.float "mr_inc", limit: 24
    t.datetime "ex_div"
    t.datetime "div_record"
    t.datetime "div_pay"
    t.string "qtly_sched"
    t.float "annual_div", limit: 24
    t.float "payout", limit: 24
    t.float "i_graham", limit: 24
    t.float "p_e", limit: 24
    t.integer "fye_month"
    t.float "ttm_eps", limit: 24
    t.float "peg_ratio", limit: 24
    t.float "ttm_p_sales", limit: 24
    t.float "mrq_p_book", limit: 24
    t.float "ttm_roe", limit: 24
    t.float "ty_growth", limit: 24
    t.float "ny_growth", limit: 24
    t.float "last_5_growth", limit: 24
    t.float "est_5_growth", limit: 24
    t.integer "na"
    t.integer "mktcap"
    t.float "inside_own", limit: 24
    t.float "debt_equity", limit: 24
    t.float "chowder_rule", limit: 24
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["industry_id"], name: "index_stocks_on_industry_id"
    t.index ["sector_id"], name: "index_stocks_on_sector_id"
    t.index ["symbol"], name: "index_stocks_on_symbol", unique: true
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "industries", "sectors"
  add_foreign_key "stocks", "industries"
  add_foreign_key "stocks", "sectors"
end
