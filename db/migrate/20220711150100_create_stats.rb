class CreateStats < ActiveRecord::Migration[6.1]
  def change
    create_table :stats do |t|
      t.bigint :stock_id
      t.date   :date
      t.float :total_cash
      t.float :current_debt
      t.float :revenue
      t.float :gross_profit
      t.float :total_revenue
      t.float :ebitda
      t.float :revenue_per_share
      t.float :revenue_per_employee
      t.float :debt_to_equity
      t.float :profit_margin
      t.float :enterprise_value
      t.float :enterprise_value_to_revenue
      t.float :price_to_sales
      t.float :price_to_book
      t.float :forward_pe_ratio
      t.float :pe_high
      t.float :pe_low
      t.float :peg_ratio
      t.string :week_52_high_date
      t.string :week_52_low_date
      t.float :beta
      t.float :put_call_ratio
      t.string :company_name
      t.float :market_cap
      t.float :week_52_high
      t.float :week_52_low
      t.float :week_52_change
      t.float :dividend_yield
      t.string :ex_dividend_date
      t.float :shares_outstanding
      t.float :float
      t.float :ttm_eps
      t.float :day_200_moving_avg
      t.float :day_50_moving_avg
      t.float :year_5_change_percent
      t.float :year_2_change_percent
      t.float :year_1_change_percent
      t.float :ytd_change_percent
      t.float :month_6_change_percent
      t.float :month_3_change_percent
      t.float :month_1_change_percent
      t.float :day_5_change_percent
      t.float :employees
      t.float :avg_10_volume
      t.float :avg_30_volume
      t.float :ttm_dividend_rate
      t.float :max_change_percent
      t.float :day_30_change_percent
      t.string :next_dividend_date
      t.string :next_earnings_date
      t.float :pe_ratio

      t.timestamps
    end
  end
end
