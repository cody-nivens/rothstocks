class DividendsGrid < BaseGrid

  scope do
    Dividend.order("stocks.name").joins(:stock)
  end

  filter(:date, :enum, :select => proc{ 
    Dividend.find_by_sql("select distinct date from dividends order by date desc").map{|c| [c.date.strftime("%Y-%m-%d"),c.date]}})

#  filter(:div_yield, :float) do |value|
#      self.where(["div_yield >= ?", value])
#  end
#  filter(:p_e, :float) do |value|
#      self.where(["p_e <= ?", value])
#  end
#  filter(:peg_ratio, :float) do |value|
#    self.where(["peg_ratio <= ? and peg_ratio >= 1.0", value])
#  end

  filter(:stock_id, :integer)
  filter(:sector_id, :enum, :select => proc { Sector.all.order(:name).map {|c| [c.name, c.id] }})
  filter(:industry_id, :enum, :select => proc { Industry.joins(:sector).all.order("sectors.name asc, industries.name asc").map {|c| ["#{c.sector.name}:#{c.name}", c.id] }})
  filter(:exclude, :enum, :select => proc { Sector.all.order(:name).map {|c| [c.name, c.id] }}, :checkboxes => true) do |value|
    self.where("dividends.sector_id not in ( ? )",value)
  end


  filter(:condition1, :dynamic)
  filter(:condition2, :dynamic)
  filter(:condition3, :dynamic)

  column(:payment_date, :header => "Date", :html => true) do |dr|
    link_to dr.payment_date.strftime("%Y-%m-%d"), stock_path(dr.stock.id)
  end

  column(:symbol, :header => "Sym", :html => true, :order => "stocks.symbol") do |dividend|
      link_to dividend.stock.symbol, stock_path(dividend.stock)
  end
  column(:name, :html => true, :order =>"stocks.name") do |dividend|
	  link_to dividend.stock.name, stock_path(dividend.stock)
  end
  column(:sector, :html => true, :order => "dividends.sector_id") do |dividend|
       dividend.stock.sector.name
  end
  column(:industry, :html => true, :order => "dividends.industry_id") do |dividend|
       dividend.stock.industry.name
  end
  column(:amount) do
       "%.2f" %  self.amount
  end
#  column(:actions, :html => true ) do |dividend|
#	  link_to "View", "/dividends/#{dividend.id}"
#  end
end
