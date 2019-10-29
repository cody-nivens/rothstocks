require 'test_helper'

class ChampionControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in @user
  end

  test "should get index" do
    get champion_index_url
    assert_response :success
  end

end
