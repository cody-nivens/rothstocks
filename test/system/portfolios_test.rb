require "application_system_test_case"

class PortfoliosTest < ApplicationSystemTestCase
    setup do
        @user = users(:one)
        sign_in @user
    end

   test "visiting the index" do
     visit portfolios_url
  
     assert_text "New Portfolio"
   end
end
