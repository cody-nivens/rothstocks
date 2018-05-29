require 'test_helper'

class SectorsControllerTest < ActionDispatch::IntegrationTest
include Devise::Test::IntegrationHelpers
  setup do
    @sector = sectors(:one)
    @user = users(:one)
  end

  test "should get index" do
    get sectors_url
    assert_response :success
  end

  test "should get new" do
    sign_in @user
    get new_sector_url
    assert_response :success
  end

  test "should create sector" do
    sign_in @user
    assert_difference('Sector.count') do
      post sectors_url, params: { sector: { name: "#{@sector.name}3" } }
    end

    assert_redirected_to sector_url(Sector.last)
  end

  test "should not create sector" do
    sign_in @user
    assert_difference('Sector.count', 0) do
      post sectors_url, params: { sector: { name: "#{@sector.name}" } }
    end

    assert_response :success
  end

  test "should show sector" do
    get sector_url(@sector)
    assert_response :success
  end

  test "should get edit" do
    sign_in @user
    get edit_sector_url(@sector)
    assert_response :success
  end

  test "should update sector" do
    sign_in @user
    patch sector_url(@sector), params: { sector: { name: @sector.name } }
    assert_redirected_to sector_url(@sector)
  end

  test "should not update sector" do
    sign_in @user
    patch sector_url(@sector), params: { sector: { name: "" } }
    assert_response :success
  end

  test "should destroy sector" do
    sign_in @user
    assert_difference('Sector.count', 0) do
      assert_difference('Sector.count', 1) do
        post sectors_url, params: { sector: { name: "#{@sector.name}4" } }
      end
      assert_difference('Sector.count', -1) do
        delete sector_url(Sector.find_by_name("#{@sector.name}4"))
      end

      assert_redirected_to sectors_url
    end
  end
end
