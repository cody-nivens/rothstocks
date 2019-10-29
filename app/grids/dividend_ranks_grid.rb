class DividendRanksGrid < BaseGrid

  scope do
    DividendRank.order("stocks.name").joins(:stock)
  end

  filter(:date, :enum, :select => proc{ 
    DividendRank.find_by_sql("select distinct date from dividend_ranks order by date desc").map{|c| [c.date.strftime("%Y-%m-%d"),c.date]}})

  filter(:div_yield, :float) do |value|
      self.where(["div_yield >= ?", value])
  end
  filter(:p_e, :float) do |value|
      self.where(["p_e <= ?", value])
  end
  filter(:peg_ratio, :float) do |value|
    self.where(["peg_ratio <= ? and peg_ratio >= 1.0", value])
  end

  filter(:stock_id, :integer)
  filter(:sector_id, :enum, :select => proc { Sector.all.order(:name).map {|c| [c.name, c.id] }})
  filter(:industry_id, :enum, :select => proc { Industry.joins(:sector).all.order("sectors.name asc, industries.name asc").map {|c| ["#{c.sector.name}:#{c.name}", c.id] }})
  filter(:exclude, :enum, :select => proc { Sector.all.order(:name).map {|c| [c.name, c.id] }}, :checkboxes => true) do |value|
    self.where("dividend_ranks.sector_id not in ( ? )",value)
  end


  filter(:condition1, :dynamic)
  filter(:condition2, :dynamic)
  filter(:condition3, :dynamic)

  column(:ccc_seq, :header => "CCC")

  column(:date, :header => "Date", :html => true) do |dr|
      link_to dr.date.strftime("%Y-%m-%d"), dividend_rank_path(dr.id)
  end

  column(:symbol, :header => "Sym", :html => true, :order => "stocks.symbol") do |dividend_rank|
      link_to dividend_rank.stock.symbol, stock_path(dividend_rank.stock)
  end
  column(:name, :html => true, :order =>"stocks.name") do |dividend_rank|
	  link_to dividend_rank.stock.name, stock_path(dividend_rank.stock)
  end
  column(:sector, :html => true, :order => "dividend_ranks.sector_id") do |dividend_rank|
       dividend_rank.stock.sector.name
  end
  column(:industry, :html => true, :order => "dividend_ranks.industry_id") do |dividend_rank|
       dividend_rank.stock.industry.name
  end
  column(:price) do
       "%.2f" %  self.price
  end
  column(:div_yield, :header => "Yield") do
       "%.2f" %  self.div_yield
  end
  column(:p_e, :header => "P/E") do
	   "%.2f" %  self.p_e
  end
  column(:ttm_eps, :header => "EPS") do
	   "%.2f" %  self.ttm_eps
  end
  column(:peg_ratio, :header => "PEG Ratio") do
	   "%.2f" %  self.peg_ratio unless self.peg_ratio.nil?
  end
  column(:yield_years, :header => "Years") do
       "%d" %  self.yield_years
  end
  column(:old_rate, :header => "Old Rate") do
	   "%.2f" %  self.old_rate unless self.old_rate.nil? 
  end
  column(:new_rate, :header => "New Rate") do
	   "%.2f" %  self.new_rate unless self.new_rate.nil?
  end
  column(:last_5_growth, :header => "Last 5 Growth") do
	   "%.2f" %  self.last_5_growth unless self.last_5_growth.nil? 
  end
  column(:est_5_growth, :header => "Ext 5 Growth") do
	   "%.2f" %  self.est_5_growth unless self.est_5_growth.nil?
  end
#  column(:actions, :html => true ) do |dividend_rank|
#	  link_to "View", "/dividend_ranks/#{dividend_rank.id}"
#  end
end
