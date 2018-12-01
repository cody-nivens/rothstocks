require 'test_helper'

class HoldingTest < ActiveSupport::TestCase
  def setup
    @holding = holdings(:one)
  end

  test "should create holding" do
	  a = Holding.new
	  a.portfolio_id = portfolios(:one).id
      a.held = Stock.find_by_symbol('F')
	  a.save
	  assert_equal 'F',a.held.symbol
  end

  test 'valid holding' do
    assert @holding.valid?
  end

  test 'invalid without holding' do
    @holding.held = nil
    refute @holding.valid?
    assert_not_nil @holding.errors[:held]
  end

end
