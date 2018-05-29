# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if User.find_by_email('palo@alto.com').nil?
  user = User.create!(email: 'palo@alto.com', 
               password: '123456789', 
               password_confirmation: '123456789')
  user.add_role :admin
end
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'
require 'spreadsheet'


if Sector.count == 0
CSV.foreach(Rails.root.join('db', 'seeds', 'sectors.csv'), headers: true) do |row|
  s = Sector.new
  s.name = row['name']
  s.save
end
end

if Industry.count == 0
CSV.foreach(Rails.root.join('db', 'seeds', 'sector_industries.csv'), headers: true) do |row|
  s = Industry.new
  s.name = row['name']
  s.sector_id = Sector.find_by_name(row['sector']).id
  s.save
end
end


if Stock.count == 0
book = Spreadsheet.open(Rails.root.join('db', 'seeds', 'champions.xls'))

sheet = book.worksheet 'All CCC'

sheet.each 6 do |row|
  break if row[0] == 'Averages for'
  s = Stock.new
  s.name = row[0]
  s.symbol = row[1]
  s.industry_id = Industry.find_by_name(row[2]).id
  s.sector_id = Sector.find_by_name(row[83]).id
  s.ccc_seq = row[4]
  s.price = row[7]
  s.yield_years = row[3]
  s.div_yield = row[8]
  s.old_rate = row[9]
  s.new_rate = row[10]
  s.mr_inc = row[11]
  s.ex_div = row[12]
  s.div_record = row[13]
  s.div_pay = row[14]
  s.qtly_sched = row[15]
  s.annual_div = row[17]
  s.payout = row[18]
  s.i_graham = row[19]
  s.p_e = row[20]
  s.fye_month = row[21]
  s.ttm_eps = row[22]
  s.peg_ratio = row[23]
  s.ttm_p_sales = row[24]
  s.mrq_p_book = row[25]
  s.ttm_roe = row[26]
  s.ty_growth = row[27]
  s.ny_growth = row[28]
  s.last_5_growth = row[29]
  s.est_5_growth = row[30]
  s.na = row[31]
  s.mktcap = row[32]
  s.inside_own = row[33]
  s.debt_equity = row[34]
  s.chowder_rule = row[85]
  s.save

end

end
