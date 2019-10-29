class Stock < ApplicationRecord
  belongs_to :industry
  belongs_to :sector

  has_many :holdings
  has_many :dividend_ranks

  validates_uniqueness_of :symbol
  validates_presence_of :symbol
  validates_presence_of :name

  def quote
     val = $redis.get(symbol)
     return ActiveSupport::JSON.decode(val) unless val.nil?
     
     client = IEX::Api::Client.new(
  publishable_token: 'pk_3ad1f157ad284133a89ded467a57a779',
  endpoint: 'https://cloud.iexapis.com/v1'
)
     last_quote = client.quote(symbol).to_json
     #StockQuote::Stock.new(api_key: 'YOUR_API_KEY')
#     last_quote = StockQuote::Stock.quote(:sym => symbol, api_key: 'sk_67bb18cfaa694077863abedbc3439170').to_json

     $redis.set(symbol, last_quote)

     return ActiveSupport::JSON.decode(last_quote)
  end
end
