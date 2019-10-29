class Holding < ApplicationRecord

  belongs_to :stock
  belongs_to :portfolio

  validates_presence_of :stock
  has_one :sector_id, :through => :stock

  def holding_symbol
    stock.try(:symbol)
  end

#  def holding_symbol=(symbol)
#    self.holding = Stock.find_by(symbol: symbol.split(" ")[0]) if symbol.present?
#  end

  def value
    quote = stock.quote
    return nil if quote.nil?
    price = quote["latest_price"]
    return nil if price.nil?
    return price.to_f * quantity
  end

  def cost
    return price
  end

  def div_value
    a = self.stock.dividend_ranks.last.new_rate
    return 0.0 if a.nil?
   a * self.quantity
  end
end
