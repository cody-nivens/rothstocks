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
exit

Stock.all.each { |stock|
  puts "#{stock.symbol}: #{stock.name}"
  company = stock.company
  my_attributes = company.except("company_name").except("symbol").except("industry").except("sector").except("tags")

  next if Company.where(name: company.company_name).exists?
  puts company.except("symbol")

  my_comp = Company.find_or_create_by(name: company.company_name)
  my_comp.update(my_attributes)
  
  sector = Sector.find_or_create_by(name: company.sector)

  industry = Industry.find_or_create_by(name: company.industry, sector_id: sector.id)

  my_comp.update_attribute(:sector_id, sector.id)
  my_comp.update_attribute(:industry_id, industry.id)
  stock.update_attribute(:sector_id, sector.id)
  stock.update_attribute(:industry_id, industry.id)
  stock.update_attribute(:company_id, my_comp.id)
  
  company.tags.each do |tag|
    my_comp.tag_list.add(tag)
  end
  my_comp.save
  exit unless my_comp.errors.size == 0
}
