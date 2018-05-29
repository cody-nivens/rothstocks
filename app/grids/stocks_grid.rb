class StocksGrid < BaseGrid

  scope do
	  Stock.includes(:industry)
  end

  filter(:condition1, :dynamic)
  filter(:condition2, :dynamic)
  filter(:condition3, :dynamic)
  filter(:condition4, :dynamic)
  filter(:condition5, :dynamic)
  filter(:condition6, :dynamic)

  column(:ccc_seq, :header => "CCC")
  column(:symbol, :header => "Sym", :html => true) do |stock|
	  link_to stock.symbol, "stocks/#{stock.id}"
  end
  column(:name, :html => true) do |stock|
	  link_to stock.name, "stocks/#{stock.id}"
  end
  column(:industry) do
	  self.industry.name
  end
  column(:sector, :order => "sectors.name") do
	  self.sector.name
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
  column(:peg_ratio, :header => "PEG") do
	  "%.2f" %  self.peg_ratio
  end
  column(:yield_years, :header => "Years") do
          "% d" %  self.yield_years
  end
  column(:last_5_growth, :header => "Last 5 Growth") do
	  "%.2f" %  self.last_5_growth
  end
  column(:est_5_growth, :header => "Ext 5 Growth") do
	  "%.2f" %  self.est_5_growth
  end
  column(:actions, :html => true ) do |stock|
	  link_to "View", "stocks/#{stock.id}/add"
  end
end
