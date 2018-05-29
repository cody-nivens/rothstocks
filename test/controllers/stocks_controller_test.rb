require 'test_helper'

class StocksControllerTest < ActionDispatch::IntegrationTest
include Devise::Test::IntegrationHelpers
  setup do
    @stock = stocks(:one)
    @user = users(:one)
  end

  test "should get index" do
    get stocks_url
    assert_response :success
  end

  test "should get new" do
    sign_in @user
    get new_stock_url
    assert_response :success
  end

  test "should create stock" do
    sign_in @user
    assert_difference('Stock.count') do
      post stocks_url, params: { stock: { annual_div: @stock.annual_div, ccc_seq: @stock.ccc_seq, chowder_rule: @stock.chowder_rule, debt_equity: @stock.debt_equity, div_pay: @stock.div_pay, div_record: @stock.div_record, div_yield: @stock.div_yield, est_5_growth: @stock.est_5_growth, ex_div: @stock.ex_div, fye_month: @stock.fye_month, i_graham: @stock.i_graham, industry_id: @stock.industry_id, inside_own: @stock.inside_own, last_5_growth: @stock.last_5_growth, mktcap: @stock.mktcap, mr_inc: @stock.mr_inc, mrq_p_book: @stock.mrq_p_book, na: @stock.na, name: @stock.name, new_rate: @stock.new_rate, ny_growth: @stock.ny_growth, old_rate: @stock.old_rate, p_e: @stock.p_e, payout: @stock.payout, peg_ratio: @stock.peg_ratio, price: @stock.price, qtly_sched: @stock.qtly_sched, sector_id: @stock.sector_id, symbol: "#{@stock.symbol}3", ttm_eps: @stock.ttm_eps, ttm_p_sales: @stock.ttm_p_sales, ttm_roe: @stock.ttm_roe, ty_growth: @stock.ty_growth, yield_years: @stock.yield_years } }
    end

    assert_redirected_to stock_url(Stock.last)
  end

  test "should not create stock" do
    sign_in @user
    assert_difference('Stock.count', 0) do
      post stocks_url, params: { stock: { annual_div: @stock.annual_div, ccc_seq: @stock.ccc_seq, chowder_rule: @stock.chowder_rule, debt_equity: @stock.debt_equity, div_pay: @stock.div_pay, div_record: @stock.div_record, div_yield: @stock.div_yield, est_5_growth: @stock.est_5_growth, ex_div: @stock.ex_div, fye_month: @stock.fye_month, i_graham: @stock.i_graham, industry_id: @stock.industry_id, inside_own: @stock.inside_own, last_5_growth: @stock.last_5_growth, mktcap: @stock.mktcap, mr_inc: @stock.mr_inc, mrq_p_book: @stock.mrq_p_book, na: @stock.na, name: @stock.name, new_rate: @stock.new_rate, ny_growth: @stock.ny_growth, old_rate: @stock.old_rate, p_e: @stock.p_e, payout: @stock.payout, peg_ratio: @stock.peg_ratio, price: @stock.price, qtly_sched: @stock.qtly_sched, sector_id: @stock.sector_id, symbol: "#{@stock.symbol}", ttm_eps: @stock.ttm_eps, ttm_p_sales: @stock.ttm_p_sales, ttm_roe: @stock.ttm_roe, ty_growth: @stock.ty_growth, yield_years: @stock.yield_years } }
    end

    assert_response :success
  end

  test "should show stock" do
    get stock_url(@stock)
    assert_response :success
  end

  test "should get edit" do
    sign_in @user
    get edit_stock_url(@stock)
    assert_response :success
  end

  test "should update stock" do
    sign_in @user
    patch stock_url(@stock), params: { stock: { annual_div: @stock.annual_div, ccc_seq: @stock.ccc_seq, chowder_rule: @stock.chowder_rule, debt_equity: @stock.debt_equity, div_pay: @stock.div_pay, div_record: @stock.div_record, div_yield: @stock.div_yield, est_5_growth: @stock.est_5_growth, ex_div: @stock.ex_div, fye_month: @stock.fye_month, i_graham: @stock.i_graham, industry_id: @stock.industry_id, inside_own: @stock.inside_own, last_5_growth: @stock.last_5_growth, mktcap: @stock.mktcap, mr_inc: @stock.mr_inc, mrq_p_book: @stock.mrq_p_book, na: @stock.na, name: @stock.name, new_rate: @stock.new_rate, ny_growth: @stock.ny_growth, old_rate: @stock.old_rate, p_e: @stock.p_e, payout: @stock.payout, peg_ratio: @stock.peg_ratio, price: @stock.price, qtly_sched: @stock.qtly_sched, sector_id: @stock.sector_id, symbol: @stock.symbol, ttm_eps: @stock.ttm_eps, ttm_p_sales: @stock.ttm_p_sales, ttm_roe: @stock.ttm_roe, ty_growth: @stock.ty_growth, yield_years: @stock.yield_years } }
    assert_redirected_to stock_url(@stock)
  end

  test "should not update stock" do
    sign_in @user
    patch stock_url(@stock), params: { stock: { annual_div: @stock.annual_div, ccc_seq: @stock.ccc_seq, chowder_rule: @stock.chowder_rule, debt_equity: @stock.debt_equity, div_pay: @stock.div_pay, div_record: @stock.div_record, div_yield: @stock.div_yield, est_5_growth: @stock.est_5_growth, ex_div: @stock.ex_div, fye_month: @stock.fye_month, i_graham: @stock.i_graham, industry_id: @stock.industry_id, inside_own: @stock.inside_own, last_5_growth: @stock.last_5_growth, mktcap: @stock.mktcap, mr_inc: @stock.mr_inc, mrq_p_book: @stock.mrq_p_book, na: @stock.na, name: @stock.name, new_rate: @stock.new_rate, ny_growth: @stock.ny_growth, old_rate: @stock.old_rate, p_e: @stock.p_e, payout: @stock.payout, peg_ratio: @stock.peg_ratio, price: @stock.price, qtly_sched: @stock.qtly_sched, sector_id: @stock.sector_id, symbol: "", ttm_eps: @stock.ttm_eps, ttm_p_sales: @stock.ttm_p_sales, ttm_roe: @stock.ttm_roe, ty_growth: @stock.ty_growth, yield_years: @stock.yield_years } }
    assert_response :success
  end

  test "should destroy stock" do
    sign_in @user
    assert_difference('Stock.count', -1) do
      delete stock_url(@stock)
    end

    assert_redirected_to stocks_url
  end
end
