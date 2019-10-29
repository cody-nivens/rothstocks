class Portfolio < ApplicationRecord
  belongs_to :user
  validates_presence_of :name

  has_many :holdings

  def value
    val = 0.0
    self.holdings.each do |stock|
      val += stock.value.to_f
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

  def div_value
    val = 0.0
    self.holdings.each do |holding|
      val += holding.div_value
    end
    return val
  end

  def contains?(symbol)
    holdings.select{|x| x.stock.symbol == symbol}
  end

  def symbols
    holdings.collect{|x| x.stock.symbol}.uniq
  end

  def sector_list
    sectors = {}
    holdings.each do |holding|
      sectors[holding.stock.sector.name] = 0 if sectors[holding.stock.sector.name].nil?
      sectors[holding.stock.sector.name] += 1
    end
    sectors
  end

  def industry_list
    industrys = {}
    holdings.each do |holding|
      industrys[holding.stock.industry.name] = 0 if industrys[holding.stock.industry.name].nil?
      industrys[holding.stock.industry.name] += 1
    end
    industrys
  end

  def pay_div(symbol)
    sum = 0.0
    holdings.map{|x| (x.stock.symbol == symbol ? sum += x.quantity : 0)}
    stock = Stock.find_by_symbol(symbol)
    div_rec = DividendRank.where(stock_id: stock.id).group_by_month(:date).last
    quantity = sum * div_rec.div_yield / div_rec.price
    new_holding = Holding.create(stock: stock, quantity: quantity, price: sum*div_rec.new_rate, date: div_rec.div_pay)
    holdings << new_holding
  end
end
