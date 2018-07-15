class Stock < ApplicationRecord
  belongs_to :industry
  belongs_to :sector

  validates_uniqueness_of :symbol
  validates_presence_of :symbol
  validates_presence_of :name

  def quote
     val = $redis.get(symbol)
     return ActiveSupport::JSON.decode(val) unless val.nil?
     
     last_quote = StockQuote::Stock.quote(symbol)

     $redis.set(symbol, last_quote.to_json)

     return last_quote
  end
end
