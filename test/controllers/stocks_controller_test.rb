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

  test "should get index as json" do
    get stocks_url, as: :json
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
      post stocks_url, params: { stock: { name: @stock.name, industry_id: @stock.industry_id, sector_id: @stock.sector_id, symbol: "#{@stock.symbol}3",
} }
    end

    assert_redirected_to stock_url(Stock.last)
  end

  test "should not create stock" do
    sign_in @user
    assert_difference('Stock.count', 0) do
      post stocks_url, params: { stock: { 
 industry_id: @stock.industry_id, name: @stock.name, sector_id: @stock.sector_id, symbol: "#{@stock.symbol}" } }
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
    patch stock_url(@stock), params: { stock: { industry_id: @stock.industry_id, name: @stock.name, sector_id: @stock.sector_id, symbol: @stock.symbol } }
    assert_redirected_to stock_url(@stock)
  end

  test "should not update stock" do
    sign_in @user
    patch stock_url(@stock), params: { stock: { 
industry_id: @stock.industry_id, 
 name: @stock.name, 
 sector_id: @stock.sector_id, symbol: "" }}
    assert_response :success
  end

  test "should destroy stock" do
    sign_in @user
    @stock.dividend_rank.delete_all
    assert_difference('Stock.count', -1) do
      delete stock_url(@stock)
    end

    assert_redirected_to stocks_url
  end
end
