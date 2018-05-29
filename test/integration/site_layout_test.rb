require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:one)
  end

  test "layout links" do
    # Not signed in
    get root_path
    assert_template 'welcome/index'
    assert_template 'layouts/_side_column'
    assert_template 'layouts/_navigation_links'
    assert_template 'layouts/_nav_links_for_auth'
    assert_template 'layouts/_navigation'
    assert_template 'layouts/_messages'
    assert_template 'layouts/application'


    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", new_user_session_path, count: 1
    assert_select "a[href=?]", new_user_registration_path
    get new_user_registration_path
    assert_template 'devise/registrations/new'
    assert_select "title", "Roth Stocks"
    get new_user_session_path
    assert_template 'devise/sessions/new'
    assert_select "title", "Roth Stocks"
    # Signed in
    sign_in @user
    get root_path
    assert_template 'welcome/index'
    assert_select "a[href=?]", new_user_session_path, count: 0
    assert_select "a[href=?]", new_user_registration_path, count: 0
    assert_select "a[href=?]", edit_user_registration_path
    assert_select "a[href=?]", destroy_user_session_path
    get edit_user_registration_path
    assert_template 'devise/registrations/edit'
    assert_select "title", "Roth Stocks"
  end
end
