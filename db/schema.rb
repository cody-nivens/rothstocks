# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_07_11_225254) do

  create_table "companies", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.bigint "stock_id"
    t.string "exchange"
    t.bigint "industry_id"
    t.text "website"
    t.text "description"
    t.string "ceo"
    t.string "security_name"
    t.string "issue_type"
    t.bigint "sector_id"
    t.integer "employees"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "dividend_ranks", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "stock_id"
    t.datetime "date"
    t.integer "ccc_seq"
    t.float "price"
    t.integer "yield_years"
    t.float "div_yield"
    t.float "old_rate"
    t.float "new_rate"
    t.float "mr_inc"
    t.datetime "ex_div"
    t.datetime "div_record"
    t.datetime "div_pay"
    t.string "qtly_sched"
    t.float "annual_div"
    t.float "payout"
    t.float "i_graham"
    t.float "p_e"
    t.integer "fye_month"
    t.float "ttm_eps"
    t.float "peg_ratio"
    t.float "ttm_p_sales"
    t.float "mrq_p_book"
    t.float "ttm_roe"
    t.float "ty_growth"
    t.float "ny_growth"
    t.float "last_5_growth"
    t.float "est_5_growth"
    t.integer "na"
    t.integer "mktcap"
    t.float "inside_own"
    t.float "debt_equity"
    t.float "chowder_rule"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "sector_id"
    t.integer "industry_id"
    t.index ["stock_id"], name: "index_dividend_ranks_on_stock_id"
  end

  create_table "dividends", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "stock_id"
    t.date "ex_date"
    t.date "payment_date"
    t.date "record_date"
    t.date "declared_date"
    t.float "amount"
    t.string "currency"
    t.string "description"
    t.string "frequency"
    t.date "date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "historical_prices", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "stock_id"
    t.date "date"
    t.float "open"
    t.float "close"
    t.float "high"
    t.float "low"
    t.float "volume"
    t.float "u_open"
    t.float "u_close"
    t.float "u_low"
    t.float "u_high"
    t.float "u_volume"
    t.float "change"
    t.float "change_percent"
    t.string "label"
    t.float "change_over_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "holdings", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "stock_id"
    t.float "price"
    t.float "quantity"
    t.datetime "date"
    t.bigint "portfolio_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["portfolio_id"], name: "index_holdings_on_portfolio_id"
    t.index ["stock_id"], name: "index_holdings_on_held_type_and_stock_id"
  end

  create_table "industries", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.bigint "sector_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sector_id"], name: "index_industries_on_sector_id"
  end

  create_table "portfolios", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.text "descripion"
    t.datetime "start_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_portfolios_on_user_id"
  end

  create_table "roles", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["name"], name: "index_roles_on_name"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "sectors", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_sectors_on_name", unique: true
  end

  create_table "stats", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "stock_id"
    t.date "date"
    t.float "total_cash"
    t.float "current_debt"
    t.float "revenue"
    t.float "gross_profit"
    t.float "total_revenue"
    t.float "ebitda"
    t.float "revenue_per_share"
    t.float "revenue_per_employee"
    t.float "debt_to_equity"
    t.float "profit_margin"
    t.float "enterprise_value"
    t.float "enterprise_value_to_revenue"
    t.float "price_to_sales"
    t.float "price_to_book"
    t.float "forward_pe_ratio"
    t.float "pe_high"
    t.float "pe_low"
    t.float "peg_ratio"
    t.string "week_52_high_date"
    t.string "week_52_low_date"
    t.float "beta"
    t.float "put_call_ratio"
    t.string "company_name"
    t.float "market_cap"
    t.float "week_52_high"
    t.float "week_52_low"
    t.float "week_52_change"
    t.float "dividend_yield"
    t.string "ex_dividend_date"
    t.float "shares_outstanding"
    t.float "float"
    t.float "ttm_eps"
    t.float "day_200_moving_avg"
    t.float "day_50_moving_avg"
    t.float "year_5_change_percent"
    t.float "year_2_change_percent"
    t.float "year_1_change_percent"
    t.float "ytd_change_percent"
    t.float "month_6_change_percent"
    t.float "month_3_change_percent"
    t.float "month_1_change_percent"
    t.float "day_5_change_percent"
    t.float "employees"
    t.float "avg_10_volume"
    t.float "avg_30_volume"
    t.float "ttm_dividend_rate"
    t.float "max_change_percent"
    t.float "day_30_change_percent"
    t.string "next_dividend_date"
    t.string "next_earnings_date"
    t.float "pe_ratio"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "stocks", charset: "utf8mb3", force: :cascade do |t|
    t.string "symbol"
    t.string "name"
    t.bigint "industry_id"
    t.bigint "sector_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "company_id"
    t.string "primary_exchange"
    t.string "calculation_price"
    t.float "open"
    t.float "open_time"
    t.float "close"
    t.float "close_time"
    t.float "high"
    t.float "low"
    t.float "latest_price"
    t.string "latest_source"
    t.string "latest_time"
    t.float "latest_update"
    t.float "latest_volume"
    t.float "iex_realtime_price"
    t.float "iex_realtime_size"
    t.float "iex_last_updated"
    t.float "delayed_price"
    t.float "delayed_price_time"
    t.float "extended_price"
    t.float "extended_change_percent"
    t.float "extended_price_time"
    t.float "previous_close"
    t.float "change"
    t.float "change_percent"
    t.float "iex_market_percent"
    t.float "iex_volume"
    t.float "avg_total_volume"
    t.float "iex_bid_price"
    t.float "iex_bid_size"
    t.float "iex_ask_price"
    t.float "iex_ask_size"
    t.float "market_cap"
    t.float "pe_ratio"
    t.float "week_52_high"
    t.float "week_52_low"
    t.float "ytd_change"
    t.index ["industry_id"], name: "index_stocks_on_industry_id"
    t.index ["sector_id"], name: "index_stocks_on_sector_id"
    t.index ["symbol"], name: "index_stocks_on_symbol", unique: true
  end

  create_table "taggings", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "tag_id"
    t.string "taggable_type"
    t.bigint "taggable_id"
    t.string "tagger_type"
    t.bigint "tagger_id"
    t.string "context", limit: 128
    t.datetime "created_at"
    t.string "tenant", limit: 128
    t.index ["context"], name: "index_taggings_on_context"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "taggings_taggable_context_idx"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id"
    t.index ["taggable_type", "taggable_id"], name: "index_taggings_on_taggable_type_and_taggable_id"
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type"
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id"
    t.index ["tagger_type", "tagger_id"], name: "index_taggings_on_tagger_type_and_tagger_id"
    t.index ["tenant"], name: "index_taggings_on_tenant"
  end

  create_table "tags", charset: "utf8mb3", force: :cascade do |t|
    t.string "name", collation: "utf8mb3_bin"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "users", charset: "utf8mb3", force: :cascade do |t|
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

  create_table "users_roles", id: false, charset: "utf8mb3", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "dividend_ranks", "stocks"
  add_foreign_key "holdings", "portfolios"
  add_foreign_key "industries", "sectors"
  add_foreign_key "portfolios", "users"
  add_foreign_key "stocks", "industries"
  add_foreign_key "stocks", "sectors"
end
