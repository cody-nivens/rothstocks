require 'test_helper'

class HoldingTest < ActiveSupport::TestCase
  def setup
    @holding = holdings(:one)
  end

  test "should create holding" do
	  a = Holding.new
	  a.portfolio_id = portfolios(:one).id
	  a.holding_symbol = "MS1 Smothe"
	  a.save
	  assert_equal 'MS1',a.holding.symbol
  end

  test 'valid holding' do
    assert @holding.valid?
  end

  test 'invalid without holding' do
    @holding.holding = nil
    refute @holding.valid?
    assert_not_nil @holding.errors[:holding]
  end

end
