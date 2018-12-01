require 'test_helper'

class PortfolioTest < ActiveSupport::TestCase
  def setup
    @portfolio = portfolios(:one)
  end

  test 'valid portfolio' do
    assert @portfolio.valid?
  end

  test 'return value' do
    assert @portfolio.value, 0.0
  end

  test 'return cost' do
    assert @portfolio.cost, 0.0
  end

  test 'return if present' do
    assert @portfolio.contains?('T'), 0.0
  end

  test 'return symbols' do
    assert @portfolio.symbols, ['T','F']
  end

  test 'invalid without portfolio' do
    @portfolio.name = nil
    refute @portfolio.valid?
    assert_not_nil @portfolio.errors[:portfolio]
  end

  test 'should add holding' do
    ['T','F'].each do |sym|
      stock = Stock.find_by(symbol: sym)
      @portfolio.holdings << Holding.create(held: stock, price: stock.dividend_rank.last.price*100, quantity: 100, date: Date.today)
    end
  end

  test 'should add divident reinvestment (DRIP)' do
    ['T','F'].each do |sym|
      assert_difference('Holding.count') do
        @portfolio.pay_div(sym)
      end
    end
  end
end
