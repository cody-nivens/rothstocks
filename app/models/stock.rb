class Stock < ApplicationRecord
  belongs_to :industry, optional: true
  belongs_to :sector, optional: true
  belongs_to :company, optional: true

  has_many :holdings
  has_many :dividend_ranks
  has_many :dividends
  has_one :stat
  has_many :historical_prices

  acts_as_taggable_on :tags

  validates_uniqueness_of :symbol
  validates_presence_of :symbol
  validates_presence_of :name

  def quote
     val = $redis.get("quote_#{symbol}")
     return ActiveSupport::JSON.decode(val) unless val.nil?
     
     client = IEX::Api::Client.new(
  publishable_token: 'pk_3ad1f157ad284133a89ded467a57a779',
  endpoint: 'https://cloud.iexapis.com/v1'
)
     last_quote = client.quote(symbol).to_json

     $redis.set("quote_#{symbol}", last_quote)

     return ActiveSupport::JSON.decode(last_quote)
  end

  def company
     val = $redis.get("company_#{symbol}")
     return ActiveSupport::JSON.decode(val) unless val.nil?
     
     client = IEX::Api::Client.new(
  publishable_token: 'pk_3ad1f157ad284133a89ded467a57a779',
  endpoint: 'https://cloud.iexapis.com/v1'
)
     last_quote = client.company(symbol).to_json
     $redis.set("company_#{symbol}", last_quote)

     return ActiveSupport::JSON.decode(last_quote)
  end

  def stats
     val = $redis.get("stats_#{symbol}")
     return ActiveSupport::JSON.decode(val) unless val.nil?
     
     client = IEX::Api::Client.new(
  publishable_token: 'pk_3ad1f157ad284133a89ded467a57a779',
  endpoint: 'https://cloud.iexapis.com/v1'
)
     last_quote = client.advanced_stats(symbol).to_json
     $redis.set("stats_#{symbol}", last_quote)

     return ActiveSupport::JSON.decode(last_quote)
  end

  def iex_dividends(refid)
     val = $redis.get("dividends_#{symbol}_#{refid}")
     return ActiveSupport::JSON.decode(val) unless val.nil?
     
     client = IEX::Api::Client.new(
  publishable_token: 'pk_3ad1f157ad284133a89ded467a57a779',
  endpoint: 'https://cloud.iexapis.com/v1'
)
     last_quote = client.dividends(symbol, refid).to_json
     $redis.set("dividends_#{symbol}_#{refid}", last_quote)

     return ActiveSupport::JSON.decode(last_quote)
  end
end
