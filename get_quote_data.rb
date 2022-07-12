require 'active_record'
require 'pry'
require 'pry-rails'
require 'iex-ruby-client'
require 'acts-as-taggable-on'
require 'redis'
require 'redis-namespace'
require 'byebug'

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
#     val = $redis.get("quote_#{symbol}")
#     return ActiveSupport::JSON.decode(val) unless val.nil?

     client = IEX::Api::Client.new(
  publishable_token: 'pk_3ad1f157ad284133a89ded467a57a779',
  endpoint: 'https://cloud.iexapis.com/v1'
)
     last_quote = client.quote(symbol).to_json

#     $redis.set("quote_#{symbol}", last_quote)

     return ActiveSupport::JSON.decode(last_quote)
  end
  def company
#     val = $redis.get("company_#{symbol}")
#     return ActiveSupport::JSON.decode(val) unless val.nil?

     client = IEX::Api::Client.new(
  publishable_token: 'pk_3ad1f157ad284133a89ded467a57a779',
  endpoint: 'https://cloud.iexapis.com/v1'
)
     last_quote = client.company(symbol)
     return last_quote
#     $redis.set("company_#{symbol}", last_quote)

     return ActiveSupport::JSON.decode(last_quote)
  end

end

client = IEX::Api::Client.new(
  publishable_token: 'pk_3ad1f157ad284133a89ded467a57a779',
  endpoint: 'https://cloud.iexapis.com/v1'
)

Stock.where("symbol > ?", 'QS').each { |stock|
#Stock.where(symbol: 'A').each { |stock|
  puts "#{stock.symbol}: #{stock.name}"
  quote = stock.quote
  my_attributes = quote.except("company_name", "symbol", "latest_update_t", "iex_last_updated_t", "extended_change_percent_s",
                               'change_percent_s', 'sector',
                                    'primary_exchange',
                                          'primary_exchange',
)

  my_attributes.keys.each do |key|
    puts "#{key}: #{my_attributes[key]}"
  end
  stock.update(my_attributes)
  
  stock.save
  puts stock.errors unless stock.errors.size == 0
}
