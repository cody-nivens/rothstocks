class Portfolio < ApplicationRecord
  belongs_to :user
  validates_presence_of :name

  has_many :holdings

  def value
    val = 0.0
    self.holdings.each do |held|
      val += held.value.to_f
    end
    return val
  end

  def cost
    val = 0.0
    self.holdings.each do |holding|
      val += holding.cost
    end
    return val
  end

  def contains?(symbol)
    holdings.select{|x| x.held.symbol == symbol}
  end

  def symbols
    holdings.collect{|x| x.held.symbol}.uniq
  end

  def pay_div(symbol)
    sum = 0.0
    holdings.map{|x| (x.held.symbol == symbol ? sum += x.quantity : 0)}
    stock = Stock.find_by_symbol(symbol)
    div_rec = DividendRank.where(stock_id: stock.id).group_by_month(:date).last
    quantity = sum * div_rec.div_yield / div_rec.price
    new_holding = Holding.create(held: stock, quantity: quantity, price: sum*div_rec.new_rate, date: div_rec.div_pay)
    holdings << new_holding
  end
end
