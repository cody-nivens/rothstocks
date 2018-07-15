class Holding < ApplicationRecord
  belongs_to :holding, polymorphic: true
  belongs_to :portfolio

  validates_presence_of :holding

  def holding_symbol
    holding.try(:symbol)
  end

#  def holding_symbol=(symbol)
#    self.holding = Stock.find_by(symbol: symbol.split(" ")[0]) if symbol.present?
#  end

  def value
    return holding.quote["close"].to_f * quantity
  end

  def cost
    return price
  end
end
