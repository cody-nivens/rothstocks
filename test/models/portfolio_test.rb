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

  test 'should add holding' do
    ['MS1','MS2'].each do |sym|
      stock = Stock.find_by(symbol: sym)
      @portfolio.holdings << Holding.create(holding: stock, price: stock.price*100, quantity: 100, date: Date.today)
    end
  end
end
