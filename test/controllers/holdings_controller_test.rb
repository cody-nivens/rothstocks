require 'test_helper'

class HoldingsControllerTest < ActionDispatch::IntegrationTest
include Devise::Test::IntegrationHelpers
  setup do
    @holding = holdings(:one)
    @user = users(:one)
  end

  test "should get index" do
    sign_in @user
    get holdings_url
    assert_response :success
  end

  test "should get new" do
    sign_in @user
    get new_holding_url
    assert_response :success
  end

  test "should create holding" do
    sign_in @user
    assert_difference('Holding.count') do
      post holdings_url, params: { holding: { date: @holding.date, holding_id: @holding.holding_id, holding_type: @holding.holding_type, portfolio_id: @holding.portfolio_id, price: @holding.price, quantity: @holding.quantity } }
    end

    assert_redirected_to holding_url(Holding.last)
  end

  test "should not create holding" do
    sign_in @user
    assert_difference('Holding.count', 0) do
      post holdings_url, params: { holding: { date: @holding.date, portfolio_id: @holding.portfolio_id, price: @holding.price, quantity: @holding.quantity } }
    end

    assert_response :success
  end

  test "should show holding" do
    sign_in @user
    get holding_url(@holding)
    assert_response :success
  end

  test "should get edit" do
    sign_in @user
    get edit_holding_url(@holding)
    assert_response :success
  end

  test "should update holding" do
    sign_in @user
    patch holding_url(@holding), params: { holding: { date: @holding.date, holding_id: @holding.holding_id, holding_type: @holding.holding_type, portfolio_id: @holding.portfolio_id, price: @holding.price, quantity: @holding.quantity } }
    assert_redirected_to holding_url(@holding)
  end

  test "should not update holding" do
    sign_in @user
    patch holding_url(@holding), params: { holding: { date: @holding.date, holding_id: nil, holding_type: @holding.holding_type, portfolio_id: @holding.portfolio_id, price: @holding.price, quantity: @holding.quantity } }
    assert_response :success
  end

  test "should destroy holding" do
    sign_in @user
    assert_difference('Holding.count', -1) do
      delete holding_url(@holding)
    end

    assert_redirected_to holdings_url
  end
end
