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
end
