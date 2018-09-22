class Stock < ApplicationRecord
  belongs_to :industry
  belongs_to :sector

  has_many :dividend_rank

  validates_uniqueness_of :symbol
  validates_presence_of :symbol
  validates_presence_of :name

  def quote
     val = $redis.get(symbol)
     return ActiveSupport::JSON.decode(val) unless val.nil?
     
     last_quote = StockQuote::Stock.quote(symbol).to_json

     $redis.set(symbol, last_quote)

     return ActiveSupport::JSON.decode(last_quote)
  end
end
