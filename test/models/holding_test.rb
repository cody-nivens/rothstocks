require 'test_helper'

class HoldingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should create holding" do
	  a = Holding.new
	  a.portfolio_id = portfolios(:one).id
	  a.holding_symbol = "MS1 Smothe"
	  a.save
	  assert_equal 'MS1',a.holding.symbol
  end
end
