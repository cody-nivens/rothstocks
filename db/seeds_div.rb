
#if DividendRank.count == 0
@schemas = {}
@keys = {}
@spreadsheet_names_full = []
@spreadsheet_names = []
@month_years = {}

  require_relative 'seeds_ds'
  load_schemas


def row_col_val(val)
  if val.kind_of?(Spreadsheet::Formula)
    return val.value
  end
  return val
end

@spreadsheet_names.each do |year_month|
  puts "#{year_month} is missing a month_year mapping" if @month_years[year_month].nil?
  puts "#{year_month}: missing file" unless File.exist?(Rails.root.join('db','seeds', "#{year_month}.ods"))
end

@spreadsheet_names.each do |year_month|
#["190628c"].each do |year_month|

puts "#{year_month}\n"

book = Rspreadsheet.open(Rails.root.join('db', 'seeds', "#{year_month}.ods").to_s)

sheet = book.worksheet 'All CCC'

date_row = sheet.row(5)
date = "20#{year_month}"
schema = @schemas[@month_years[year_month]]
@debug_flag = false

sheet.rows.each do |row|
  #debugger
  #if @debug_flag
  #@debug_flag = true if row[1] == 'ZTS'
  #break if row[1].nil?
  next if ["Name", "Company"].include?(row[1])
  next if row[2].nil?
  break if row[1] =~ /Averages for/
  
  #puts "'#{row[1]}'\n"

  s = Stock.find_by_symbol(row[2])
  if s.nil?
    s = Stock.new
    s.name = row[1]
    s.symbol = row[2]
    sector = Sector.find_by_name(row[@keys[schema['sector']]])
    if sector.nil?
      sector = Sector.create(name: row[@keys[schema['sector']]])
    end
    s.sector_id = sector.id
    industry = Industry.find_by_name(row[@keys[schema['industry']]])
    if industry.nil?
      industry = Industry.create(name: row[@keys[schema['industry']]], sector_id: sector.id)
    end
    s.industry_id = industry.id
    s.save
  end

  dr = DividendRank.new(stock_id: s.id)
  dr.date = date
  dr.stock_id = s.id
  dr.sector_id = s.sector.id
  dr.industry_id = s.industry.id

  schema.each do |key, alphac|
    next if ["industry","sector"].include?(key)
    col = @keys[alphac]
    next if row[col] == "-"
    next if row[col].kind_of?(Spreadsheet::Formula) && row[col].value.kind_of?(Spreadsheet::Excel::Error)
    next if row[col].kind_of?(Spreadsheet::Excel::Error)
    dr.send("#{key}=", row_col_val(row[col]))
  end
  begin
    dr.save
  rescue
    puts "#{row[1]}" 
    schema.each do |key, alphac|
      next if ["industry","sector"].include?(key)
    col = @keys[alphac]
      puts "Key: #{key}=#{row[col]}\n"
    end
  end
end
end

#end
