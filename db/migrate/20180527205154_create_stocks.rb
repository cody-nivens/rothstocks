class CreateStocks < ActiveRecord::Migration[5.1]
  def change
    create_table :stocks do |t|
      t.string :symbol
      t.string :name
      t.references :industry, foreign_key: true
      t.references :sector, foreign_key: true
      t.integer :ccc_seq
      t.float :price
      t.integer :yield_years
      t.float :div_yield
      t.float :old_rate
      t.float :new_rate
      t.float :mr_inc
      t.datetime :ex_div
      t.datetime :div_record
      t.datetime :div_pay
      t.string :qtly_sched
      t.float :annual_div
      t.float :payout
      t.float :i_graham
      t.float :p_e
      t.integer :fye_month
      t.float :ttm_eps
      t.float :peg_ratio
      t.float :ttm_p_sales
      t.float :mrq_p_book
      t.float :ttm_roe
      t.float :ty_growth
      t.float :ny_growth
      t.float :last_5_growth
      t.float :est_5_growth
      t.integer :na
      t.integer :mktcap
      t.float :inside_own
      t.float :debt_equity
      t.float :chowder_rule

      t.timestamps
    end
    add_index :stocks, :symbol, unique: true
  end
end
