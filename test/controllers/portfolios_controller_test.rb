require 'test_helper'

class PortfoliosControllerTest < ActionDispatch::IntegrationTest
include Devise::Test::IntegrationHelpers
  setup do
    @portfolio = portfolios(:one)
    @user = users(:one)
  end

  test "should get index" do
    sign_in @user
    get portfolios_url
    assert_response :success
  end

  test "should get new" do
    sign_in @user
    get new_portfolio_url
    assert_response :success
  end

  test "should create portfolio" do
    sign_in @user
    assert_difference('Portfolio.count') do
      post portfolios_url, params: { portfolio: { descripion: @portfolio.descripion, name: @portfolio.name, start_date: @portfolio.start_date, user_id: @portfolio.user_id } }
    end

    assert_redirected_to portfolio_url(Portfolio.last)
  end

  test "should not create portfolio" do
    sign_in @user
    assert_difference('Portfolio.count', 0) do
      post portfolios_url, params: { portfolio: { descripion: @portfolio.descripion, name: "", start_date: @portfolio.start_date, user_id: @portfolio.user_id } }
    end

    assert_response :success
  end

  test "should show portfolio" do
    sign_in @user
    get portfolio_url(@portfolio)
    assert_response :success
  end

  test "should get edit" do
    sign_in @user
    get edit_portfolio_url(@portfolio)
    assert_response :success
  end

  test "should update portfolio" do
    sign_in @user
    patch portfolio_url(@portfolio), params: { portfolio: { descripion: @portfolio.descripion, name: @portfolio.name, start_date: @portfolio.start_date, user_id: @portfolio.user_id } }
    assert_redirected_to portfolio_url(@portfolio)
  end

  test "should not update portfolio" do
    sign_in @user
    patch portfolio_url(@portfolio), params: { portfolio: { descripion: @portfolio.descripion, name: "", start_date: @portfolio.start_date, user_id: @portfolio.user_id } }
    assert_response :success
  end

  test "should destroy portfolio" do
    sign_in @user
    assert_difference('Portfolio.count', 0) do
      assert_difference('Portfolio.count') do
        post portfolios_url, params: { portfolio: { descripion: @portfolio.descripion, name: "#{@portfolio.name}3", start_date: @portfolio.start_date, user_id: @portfolio.user_id } }
      end
      assert_difference('Portfolio.count', -1) do
	      delete portfolio_url(Portfolio.find_by_name("#{@portfolio.name}3"))
      end

      assert_redirected_to portfolios_url
    end
  end
end
