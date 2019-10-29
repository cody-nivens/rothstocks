require 'test_helper'

class DividendRanksControllerTest < ActionDispatch::IntegrationTest
include Devise::Test::IntegrationHelpers
  setup do
    @dividend_rank = dividend_ranks(:one)
    @user = users(:one)
  end

  test "should get index" do
    get dividend_ranks_url
    assert_response :success
  end

  test "should get index as json" do
    get dividend_ranks_url, as: :json
    assert_response :success
  end

  test "should get new" do
    sign_in @user
    get new_dividend_rank_url
    assert_response :success
  end

  test "should create dividend_rank" do
    sign_in @user
    assert_difference('DividendRank.count') do
      post dividend_ranks_url, params: { dividend_rank: { stock_id: @dividend_rank.stock.id,
 annual_div: @dividend_rank.annual_div, ccc_seq: @dividend_rank.ccc_seq, chowder_rule: @dividend_rank.chowder_rule, debt_equity: @dividend_rank.debt_equity, div_pay: @dividend_rank.div_pay, div_record: @dividend_rank.div_record, div_yield: @dividend_rank.div_yield, est_5_growth: @dividend_rank.est_5_growth, ex_div: @dividend_rank.ex_div, fye_month: @dividend_rank.fye_month, i_graham: @dividend_rank.i_graham,
inside_own: @dividend_rank.inside_own, last_5_growth: @dividend_rank.last_5_growth, mktcap: @dividend_rank.mktcap, mr_inc: @dividend_rank.mr_inc, mrq_p_book: @dividend_rank.mrq_p_book, na: @dividend_rank.na,
 new_rate: @dividend_rank.new_rate, ny_growth: @dividend_rank.ny_growth, old_rate: @dividend_rank.old_rate, p_e: @dividend_rank.p_e, payout: @dividend_rank.payout, peg_ratio: @dividend_rank.peg_ratio, price: @dividend_rank.price, qtly_sched: @dividend_rank.qtly_sched,
 ttm_eps: @dividend_rank.ttm_eps, ttm_p_sales: @dividend_rank.ttm_p_sales, ttm_roe: @dividend_rank.ttm_roe, ty_growth: @dividend_rank.ty_growth, yield_years: @dividend_rank.yield_years,sector_id: @dividend_rank.sector_id, industry_id: @dividend_rank.industry_id
  } }
    end

    assert_redirected_to dividend_rank_url(DividendRank.last)
  end

  test "should not create dividend_rank" do
    sign_in @user
    assert_difference('DividendRank.count', 0) do
      post dividend_ranks_url, params: { dividend_rank: { stock_id: nil }}
    end

    assert_response :success
  end


  test "should show dividend_rank" do
    get dividend_rank_url(@dividend_rank)
    assert_response :success
  end

  test "should get edit" do
    sign_in @user
    get edit_dividend_rank_url(@dividend_rank)
    assert_response :success
  end

  test "should update dividend_rank" do
    sign_in @user
    patch dividend_rank_url(@dividend_rank), params: { dividend_rank: { stock_id: @dividend_rank.stock.id,
annual_div: @dividend_rank.annual_div, ccc_seq: @dividend_rank.ccc_seq, chowder_rule: @dividend_rank.chowder_rule, debt_equity: @dividend_rank.debt_equity, div_pay: @dividend_rank.div_pay, div_record: @dividend_rank.div_record, div_yield: @dividend_rank.div_yield, est_5_growth: @dividend_rank.est_5_growth, ex_div: @dividend_rank.ex_div, fye_month: @dividend_rank.fye_month, i_graham: @dividend_rank.i_graham, 
inside_own: @dividend_rank.inside_own, last_5_growth: @dividend_rank.last_5_growth, mktcap: @dividend_rank.mktcap, mr_inc: @dividend_rank.mr_inc, mrq_p_book: @dividend_rank.mrq_p_book, na: @dividend_rank.na,
new_rate: @dividend_rank.new_rate, ny_growth: @dividend_rank.ny_growth, old_rate: @dividend_rank.old_rate, p_e: @dividend_rank.p_e, payout: @dividend_rank.payout, peg_ratio: @dividend_rank.peg_ratio, price: @dividend_rank.price, qtly_sched: @dividend_rank.qtly_sched, 
ttm_eps: @dividend_rank.ttm_eps, ttm_p_sales: @dividend_rank.ttm_p_sales, ttm_roe: @dividend_rank.ttm_roe, ty_growth: @dividend_rank.ty_growth, yield_years: @dividend_rank.yield_years } }
    assert_redirected_to dividend_rank_url(@dividend_rank)
  end

  test "should not update dividend_rank" do
    sign_in @user
    patch dividend_rank_url(@dividend_rank), params: { dividend_rank: { stock_id: nil }}
    assert_response :success
  end

  test "should destroy dividend_rank" do
    sign_in @user
    assert_difference('DividendRank.count', -1) do
      delete dividend_rank_url(@dividend_rank)
    end

    assert_redirected_to dividend_ranks_url
  end
end
