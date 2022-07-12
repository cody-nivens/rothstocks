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

end
class Stat < ActiveRecord::Base
end


client = IEX::Api::Client.new(
  publishable_token: 'pk_3ad1f157ad284133a89ded467a57a779',
  endpoint: 'https://cloud.iexapis.com/v1'
)

#Stock.where(symbol: 'AAPL').each { |stock|
Stock.all.each { |stock|
  puts "#{stock.symbol}: #{stock.name}"
  next if Stat.where(stock_id: stock.id, date: Date.today).exists?
  stats = stock.stats
  my_attributes = stats.except( 'total_cash_dollars', 'current_debt_dollars', 'revenue_dollars', 
                                 'total_revenue_dollar', 'ebitda_dollar', 'gross_profit_dollar',
                                 'revenue_per_share_dollars', 'revenue_per_employee_dollar', 
                                 'enterprise_value_dollar', 'price_to_sales_dollar', 
                                 'market_cap_dollar', 'week_52_high_dollar', 'week_52_low_dollar', 
                                 'year_5_change_percent_s', 'year_2_change_percent_s', 'year_1_change_percent_s',
                                 'ytd_change_percent_s', 'month_6_change_percent_s', 'month_3_change_percent_s',
                                 'month_1_change_percent_s', 'day_5_change_percent_s', 'day_30_change_percent_s',
                                 'week_52_change_dollar') 



  puts my_attributes

  my_comp = Stat.find_or_create_by(stock_id: stock.id, date: Date.today)
  my_comp.update(my_attributes)
  my_comp.save
  exit unless my_comp.errors.size == 0
}
