require 'active_record'
require 'pry'
require 'pry-rails'
require 'iex-ruby-client'
require 'acts-as-taggable-on'
require 'redis'
require 'redis-namespace'

#$redis = Redis::Namespace.new("rothstock", :redis => Redis.new(host: 'redis://localhost', port: 6379))

ActiveRecord::Base.establish_connection(
  adapter: 'mysql2',
  host: 'localhost',
  username: 'root',
  password: 'test99',
  database: 'RothStocks_development'
)

class Sector < ActiveRecord::Base
end

class Industry < ActiveRecord::Base
end

class Dividend < ActiveRecord::Base
end

class Company < ActiveRecord::Base
  acts_as_taggable_on :tags
end

class Stock < ActiveRecord::Base
    belongs_to :industry, optional: true
  belongs_to :sector, optional: true

  acts_as_taggable_on :tags

  validates_uniqueness_of :symbol
  validates_presence_of :symbol
  validates_presence_of :name

  def quote
     client = IEX::Api::Client.new(
  publishable_token: 'pk_3ad1f157ad284133a89ded467a57a779',
  endpoint: 'https://cloud.iexapis.com/v1'
)
     last_quote = client.quote(symbol).to_json

     return ActiveSupport::JSON.decode(last_quote)
  end

  def company
     client = IEX::Api::Client.new(
  publishable_token: 'pk_3ad1f157ad284133a89ded467a57a779',
  endpoint: 'https://cloud.iexapis.com/v1'
)
     last_quote = client.company(symbol)
     return last_quote
  end

  def stats
     client = IEX::Api::Client.new(
  publishable_token: 'pk_3ad1f157ad284133a89ded467a57a779',
  endpoint: 'https://cloud.iexapis.com/v1'
)
     last_quote = client.advanced_stats(symbol)
     return last_quote
  end

  def dividends(refid) 
     client = IEX::Api::Client.new(
  publishable_token: 'pk_3ad1f157ad284133a89ded467a57a779',
  endpoint: 'https://cloud.iexapis.com/v1'
)
     last_quote = client.dividends(symbol, refid)
     return last_quote
  end

  def historical_prices(refid) 
     client = IEX::Api::Client.new(
  publishable_token: 'pk_3ad1f157ad284133a89ded467a57a779',
  endpoint: 'https://cloud.iexapis.com/v1'
)
     last_quote = client.historical_prices(symbol, {range: refid})
     return last_quote
  end

end
class Stat < ActiveRecord::Base
end
class HistoricalPrice < ActiveRecord::Base
end


client = IEX::Api::Client.new(
  publishable_token: 'pk_3ad1f157ad284133a89ded467a57a779',
  endpoint: 'https://cloud.iexapis.com/v1'
)

#Stock.where(symbol: 'AAPL').each { |stock|
Stock.all.each { |stock|
  puts "#{stock.symbol}: #{stock.name}"
 #next if Dividend.where(stock_id: stock.id, date: Date.today).exists?
  dividends = stock.historical_prices("3m")

 dividends = [ dividends ] unless dividends.instance_of? Array

 dividends.each do |dividend|
    my_attributes = dividend.except( 'symbol', 'flag', 'amount_dollar', 'refid',
                                'key', 'subkey', 'id', 'open_dollar', 'close_dollar',
                                'high_dollar', 'low_dollar', 'u_open_dollar',
                                'u_close_dollar', 'u_low_dollar', 'u_high_dollar',
                                'change_percent_s', 'change_over_time_s',
                                  ) 

    puts my_attributes

    my_comp = HistoricalPrice.new
    my_attributes['stock_id'] = stock.id
    my_comp.update(my_attributes)
    my_comp.save
    exit unless my_comp.errors.size == 0
  end
}
