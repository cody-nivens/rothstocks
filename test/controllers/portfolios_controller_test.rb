require 'test_helper'

class PortfoliosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @portfolio = portfolios(:one)
  end

  test "should get index" do
    get portfolios_url
    assert_response :success
  end

  test "should get new" do
    get new_portfolio_url
    assert_response :success
  end

  test "should create portfolio" do
    assert_difference('Portfolio.count') do
      post portfolios_url, params: { portfolio: { descripion: @portfolio.descripion, name: @portfolio.name, start_date: @portfolio.start_date, user_id: @portfolio.user_id } }
    end

    assert_redirected_to portfolio_url(Portfolio.last)
  end

  test "should show portfolio" do
    get portfolio_url(@portfolio)
    assert_response :success
  end

  test "should get edit" do
    get edit_portfolio_url(@portfolio)
    assert_response :success
  end

  test "should update portfolio" do
    patch portfolio_url(@portfolio), params: { portfolio: { descripion: @portfolio.descripion, name: @portfolio.name, start_date: @portfolio.start_date, user_id: @portfolio.user_id } }
    assert_redirected_to portfolio_url(@portfolio)
  end

  test "should destroy portfolio" do
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
