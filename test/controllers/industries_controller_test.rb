require 'test_helper'

class IndustriesControllerTest < ActionDispatch::IntegrationTest
include Devise::Test::IntegrationHelpers
  setup do
    @industry = industries(:one)
    @user = users(:one)
  end

  test "should get index" do
    get industries_url
    assert_response :success
  end

  test "should get new" do
  sign_in @user
    get new_industry_url
    assert_response :success
  end

  test "should create industry" do
  sign_in @user
    assert_difference('Industry.count') do
      post industries_url, params: { industry: { name: "#{@industry.name}3", sector_id: @industry.sector_id } }
    end

    assert_redirected_to industry_url(Industry.last)
  end

  test "should not create industry" do
  sign_in @user
    assert_difference('Industry.count', 0) do
      post industries_url, params: { industry: { name: "", sector_id: @industry.sector_id } }
    end

    assert_response :success
  end

  test "should show industry" do
    get industry_url(@industry)
    assert_response :success
  end

  test "should get edit" do
  sign_in @user
    get edit_industry_url(@industry)
    assert_response :success
  end

  test "should update industry" do
  sign_in @user
    patch industry_url(@industry), params: { industry: { name: @industry.name, sector_id: @industry.sector_id } }
    assert_redirected_to industry_url(@industry)
  end

  test "should not update industry" do
  sign_in @user
    patch industry_url(@industry), params: { industry: { name: "", sector_id: @industry.sector_id } }
    assert_response :success
  end

  test "should destroy industry" do
  sign_in @user
    assert_difference('Industry.count', 0) do
      assert_difference('Industry.count') do
        post industries_url, params: { industry: { name: "#{@industry.name}4", sector_id: @industry.sector_id } }
      end
      assert_difference('Industry.count', -1) do
        delete industry_url(Industry.find_by_name("#{@industry.name}4"))
      end

      assert_redirected_to industries_url
    end
  end
end
