require 'test_helper'

class PortfolioTest < ActiveSupport::TestCase
  def setup
    @portfolio = portfolios(:one)
  end

  test 'valid portfolio' do
    assert @portfolio.valid?
  end

  test 'invalid without portfolio' do
    @portfolio.name = nil
    refute @portfolio.valid?
    assert_not_nil @portfolio.errors[:portfolio]
  end
end
