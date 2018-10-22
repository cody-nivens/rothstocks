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


if DividendRank.count == 0
schemas = {
"130131" => {
"ccc_seq" => "E", "price" => "H", "yield_years" => "D", "div_yield" => "I",
  "old_rate" => "J", "new_rate" => "K", "mr_inc" => "L", "ex_div" => "M",
  "div_record" => "N", "div_pay" => "O", "qtly_sched" => "P", "annual_div" => "R",
  "payout" => "S", "i_graham" => "U", "p_e" => "V", "fye_month" => "W",
  "ttm_eps" => "X", "peg_ratio" => "Y", "ttm_p_sales" => "Z", "mrq_p_book" => "AA",
  "ttm_roe" => "AC", "ty_growth" => "AD", "ny_growth" => "AE", 
  "est_5_growth" => "AF", "na" => "AG", "mktcap" => "AH", "inside_own" => "AI",
  "debt_equity" => "AJ", "chowder_rule" => "BW", "industry" => "C", "sector" => "BU"
},
"130531" => {
"ccc_seq" => "E", "price" => "H", "yield_years" => "D", "div_yield" => "I",
  "old_rate" => "J", "new_rate" => "K", "mr_inc" => "L", "ex_div" => "M",
  "div_record" => "N", "div_pay" => "O", "qtly_sched" => "P", "annual_div" => "R",
  "payout" => "S", "i_graham" => "U", "p_e" => "V", "fye_month" => "W",
  "ttm_eps" => "X", "peg_ratio" => "Y", "ttm_p_sales" => "Z", "mrq_p_book" => "AA",
  "ttm_roe" => "AC", "ty_growth" => "AD", "ny_growth" => "AE", "last_5_growth" => "AF",
  "est_5_growth" => "AG", "na" => "AH", "mktcap" => "AI", "inside_own" => "AJ",
  "debt_equity" => "AK", "chowder_rule" => "BX", "industry" => "C", "sector" => "BV"
},
"140131" => {
"ccc_seq" => "E", "price" => "H", "yield_years" => "D", "div_yield" => "I",
  "old_rate" => "J", "new_rate" => "K", "mr_inc" => "L", "ex_div" => "M",
  "div_record" => "N", "div_pay" => "O", "qtly_sched" => "P", "annual_div" => "R",
  "payout" => "S", "i_graham" => "U", "p_e" => "V", "fye_month" => "W",
  "ttm_eps" => "X", "peg_ratio" => "Y", "ttm_p_sales" => "Z", "mrq_p_book" => "AA",
  "ttm_roe" => "AC", "ty_growth" => "AD", "ny_growth" => "AE", "last_5_growth" => "AF",
  "est_5_growth" => "AG", "na" => "AH", "mktcap" => "AI", "inside_own" => "AJ",
  "debt_equity" => "AK", "chowder_rule" => "CB", "industry" => "C", "sector" => "BZ"
},
"140530" => {
"ccc_seq" => "E", "price" => "H", "yield_years" => "D", "div_yield" => "I",
  "old_rate" => "J", "new_rate" => "K", "mr_inc" => "L", "ex_div" => "M",
  "div_record" => "N", "div_pay" => "O", "qtly_sched" => "P", "annual_div" => "R",
  "payout" => "S", "i_graham" => "T", "p_e" => "U", "fye_month" => "V",
  "ttm_eps" => "W", "peg_ratio" => "X", "ttm_p_sales" => "Y", "mrq_p_book" => "Z",
  "ttm_roe" => "AA", "ty_growth" => "AB", "ny_growth" => "AC", "last_5_growth" => "AD",
  "est_5_growth" => "AE", "na" => "AF", "mktcap" => "AG", "inside_own" => "AH",
  "debt_equity" => "AI", "chowder_rule" => "CB", "industry" => "C", "sector" => "BZ"
},
"160129" => {
"ccc_seq" => "E", "price" => "H", "yield_years" => "D", "div_yield" => "I",
  "old_rate" => "J", "new_rate" => "K", "mr_inc" => "L", "ex_div" => "M",
  "div_record" => "N", "div_pay" => "O", "qtly_sched" => "P", "annual_div" => "R",
  "payout" => "S", "i_graham" => "T", "p_e" => "U", "fye_month" => "V",
  "ttm_eps" => "W", "peg_ratio" => "X", "ttm_p_sales" => "Y", "mrq_p_book" => "Z",
  "ttm_roe" => "AA", "ty_growth" => "AB", "ny_growth" => "AC", "last_5_growth" => "AD",
  "est_5_growth" => "AE", "na" => "AF", "mktcap" => "AG", "inside_own" => "AH",
  "debt_equity" => "AI", "chowder_rule" => "CD", "industry" => "C", "sector" => "CB"
},
"171229" => {
"ccc_seq" => "E", "price" => "H", "yield_years" => "D", "div_yield" => "I",
  "old_rate" => "J", "new_rate" => "K", "mr_inc" => "L", "ex_div" => "M",
  "div_record" => "N", "div_pay" => "O", "qtly_sched" => "P", "annual_div" => "R",
  "payout" => "S", "i_graham" => "T", "p_e" => "U", "fye_month" => "V",
  "ttm_eps" => "W", "peg_ratio" => "X", "ttm_p_sales" => "Y", "mrq_p_book" => "Z",
  "ttm_roe" => "AA", "ty_growth" => "AB", "ny_growth" => "AC", "last_5_growth" => "AD",
  "est_5_growth" => "AE", "na" => "AF", "mktcap" => "AG", "inside_own" => "AH",
  "debt_equity" => "AI", "chowder_rule" => "CF", "industry" => "C", "sector" => "CD"
},
"161230" => {
"ccc_seq" => "E", "price" => "H", "yield_years" => "D", "div_yield" => "I",
  "old_rate" => "J", "new_rate" => "K", "mr_inc" => "L", "ex_div" => "M",
  "div_record" => "N", "div_pay" => "O", "qtly_sched" => "P", "annual_div" => "R",
  "payout" => "S", "i_graham" => "T", "p_e" => "U", "fye_month" => "V",
  "ttm_eps" => "W", "peg_ratio" => "X", "ttm_p_sales" => "Y", "mrq_p_book" => "Z",
  "ttm_roe" => "AA", "ty_growth" => "AB", "ny_growth" => "AC", "last_5_growth" => "AD",
  "est_5_growth" => "AE", "na" => "AF", "mktcap" => "AG", "inside_own" => "AH", "debt_equity" => "AI",
  "chowder_rule" => "CF", "industry" => "C", "sector" => "CD"
},
'180531' => {
"ccc_seq" => "E", "price" => "H", "yield_years" => "D", "div_yield" => "I",
  "old_rate" => "J", "new_rate" => "K", "mr_inc" => "L", "ex_div" => "M",
  "div_record" => "N", "div_pay" => "O", "qtly_sched" => "P", "annual_div" => "R",
  "payout" => "S", "i_graham" => "T", "p_e" => "U", "fye_month" => "V",
  "ttm_eps" => "W", "peg_ratio" => "X", "ttm_p_sales" => "Y", "mrq_p_book" => "Z",
  "ttm_roe" => "AA", "ty_growth" => "AB", "ny_growth" => "AC", "last_5_growth" => "AD",
  "est_5_growth" => "AE", "mktcap" => "AG", "inside_own" => "AH", "debt_equity" => "AI",
  "chowder_rule" => "CH", "industry" => "C", "sector" => "CF"
},
"180629" => {
"ccc_seq" => "F", "price" => "I", "yield_years" => "E", "div_yield" => "J",
  "old_rate" => "K", "new_rate" => "L", "mr_inc" => "M", "ex_div" => "N",
  "div_pay" => "O", "qtly_sched" => "Q", "payout" => "T", "annual_div" => "S",
  "i_graham" => "U", "p_e" => "V", "fye_month" => "W", "ttm_eps" => "X",
  "peg_ratio" => "Y", "ttm_p_sales" => "Z", "mrq_p_book" => "AA", "ttm_roe" => "AB",
  "ty_growth" => "AC", "ny_growth" => "AD", "last_5_growth" => "AE", "est_5_growth" => "AF",
  "mktcap" => "AG", "inside_own" => "AH", "debt_equity" => "AI", "chowder_rule" => "AQ",
  "industry" => "D", "sector" =>"C" 
}
}
keys = {
"A" => 0, "B" => 1, "C" => 2, "D" => 3, "E" => 4, "F" => 5, "G" => 6,
"H" => 7, "I" => 8, "J" => 9, "K" => 10, "L" => 11, "M" => 12, "N" => 13,
"O" => 14, "P" => 15, "Q" => 16, "R" => 17, "S" => 18, "T" => 19, "U" => 20,
"V" => 21, "W" => 22, "X" => 23, "Y" => 24, "Z" => 25, "AA" => 26, "AB" => 27,
"AC" => 28, "AD" => 29, "AE" => 30, "AF" => 31, "AG" => 32, "AH" => 33, "AI" => 34,
"AJ" => 35, "AK" => 36, "AL" => 37, "AM" => 38, "AN" => 39, "AO" => 40, "AP" => 41,
"AQ" => 42, "BU" => 72, "BV" => 72, "BW" => 74, "BX" => 75, "BY" => 76,"BZ" => 77,
"CB" => 79, "CC" => 80, "CD" => 81, "CE" => 82, "CF" => 83, "CG" => 84, "CH" => 85 }

spreadsheet_names_full = [
"130131", "130228", "130329", "130430", "130531",
"130628", "130731", "130830", "130930", "131031",
"131129", "131231", 
"140131", "140228", "140331", "140430", "140530",
"140630", "140731", "140829", "140930", "141031",
"141128", "141231", 
"150130", "150227", "150331", "150430", "150529",
"150630", "150731", "150831", "150930", "151030",
"151130", "151231", 
"160129", "160229", "160331", "160429", "160531",
"160630", "160729", "160831", "160930", "161031",
"161130", "161230", 
"170131", "170228", "170331", "170428", "170531",
"170630", "170731", "170831", "170929", "171031",
"171130", "171229", 
"180131", "180228", "180329",
"180430", "180531", "180629"]

spreadsheet_names = [
"170131", "170228", "170331", "170428", "170531",
"170630", "170731", "170831", "170929", "171031",
"171130", "171229", 
"180131", "180228", "180329",
"180430", "180531", "180629"]

month_years = {
"130131"=>'130131', "130228"=>'130131', "130329"=>'130131', "130430"=>'130131', "130531"=>'130531',
"130628"=>'130531', "130731"=>'130531', "130830"=>'130531', "130930"=>'130531', "131031"=>'130531',
"131129"=>'130531',

"131231"=>'140131', 
"140131"=>'140131', "140228"=>'140131', "140331"=>'140131', "140430"=>'140131',
"140530"=>'140530', "140630"=>'140530', "140731"=>'140530', "140829"=>'140530', "140930"=>'140530', "141031"=>'140530',
"141128"=>'140530',

"141231"=>'140530', 
"150130"=>'140530', "150227"=>'140530', "150331"=>'140530', "150430"=>'140530', "150529"=>'140530',
"150630"=>'140530', "150731"=>'140530', "150831"=>'140530', "150930"=>'140530', "151030"=>'140530',
"151130"=>'140530',

"151231"=>'160129', 
"160129"=>'160129', "160229"=>'160129', "160331"=>'160129', "160429"=>'160129', "160531"=>'160129',
"160630"=>'160129', "160729"=>'160129', "160831"=>'160129', "160930"=>'160129', "161031"=>'160129',
"161130"=>'160129',

"161230"=>'161230', 
"170131"=>'161230', "170228"=>'161230', "170331"=>'161230', "170428"=>'161230', "170531"=>'161230',
"170630"=>'161230', "170731"=>'161230', "170831"=>'161230', "170929"=>'161230', "171031"=>'161230',
'171130'=>'161230',

'171229'=>'171229','180131'=>'171229','180228'=>'171229','180329'=>'171229','180430'=>'171229',

'180531'=>'180531',
'180629'=>'180629'}

def row_col_val(val)
  if val.kind_of?(Spreadsheet::Formula)
    return val.value
  end
  return val
end

spreadsheet_names.each do |year_month|
  puts "#{year_month} is missing a month_year mapping" if month_years[year_month].nil?
  puts "#{year_month}: missing file" unless File.exist?(Rails.root.join('db','seeds', "#{year_month}.xls"))
end

spreadsheet_names.each do |year_month|
#["180629"].each do |year_month|

puts "#{year_month}\n"

book = Spreadsheet.open(Rails.root.join('db', 'seeds', "#{year_month}.xls"))

sheet = book.worksheet 'All CCC'

date_row = sheet.row(5)
date = "20#{year_month}"
schema = schemas[month_years[year_month]]

sheet.each 6 do |row|
  break if row[0] == 'Averages for'
#debugger if ['MMM','KO'].include?(row[1])
  s = Stock.find_by_symbol(row[1])
  if s.nil?
    s = Stock.new
    s.name = row[0]
    s.symbol = row[1]
    sector = Sector.find_by_name(row[keys[schema['sector']]])
#debugger if sector.nil?
    if sector.nil?
      sector = Sector.create(name: row[keys[schema['sector']]])
    end
    s.sector_id = sector.id
    industry = Industry.find_by_name(row[keys[schema['industry']]])
    if industry.nil?
      industry = Industry.create(name: row[keys[schema['industry']]], sector_id: sector.id)
    end
    s.industry_id = industry.id
    s.save
  end

  dr = DividendRank.new(stock_id: s.id)
  dr.date = date
  dr.stock_id = s.id
  schema.each do |key, alphac|
    next if ["industry","sector"].include?(key)
    col = keys[alphac]
    next if row[col] == "-"
    next if row[col].kind_of?(Spreadsheet::Formula) && row[col].value.kind_of?(Spreadsheet::Excel::Error)
    next if row[col].kind_of?(Spreadsheet::Excel::Error)
    dr.send("#{key}=", row_col_val(row[col]))
  end
#debugger if s.symbol == 'EAT'
  begin
    dr.save
  rescue
    puts "#{row[1]}" 
    schema.each do |key, alphac|
      next if ["industry","sector"].include?(key)
    col = keys[alphac]
      puts "Key: #{key}=#{row[col]}\n"
    end
  end
end
end

end
