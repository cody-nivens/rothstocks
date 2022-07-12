class StocksGrid < BaseGrid

  scope do
#    Stock.joins(:dividends).order(:name).distinct
    #Stock.joins(:dividend_ranks).order(:name).distinct

    Stock.order(:symbol).distinct
  end

  attr_accessor(:show_industry)

  filter(:div_yield, :float) do |value, scope, grid|
    scope.where("stats.dividend_yield >= ?", value).order("stats.dividend_yield").last
  end
  filter(:p_e, :float) do |value, scope, grid|
    scope.where("stats.p_e <= ?", value).order("stats.date").last
  end
  filter(:name, :string)
  filter(:symbol, :string)
#  filter(:sector_id , :enum, :select => proc { Sector.all.order(:name).map {|c| [c.name, c.id] }})
#  filter(:industry_id, :enum, :select => proc { Industry.joins(:sector).all.order("sectors.name asc, industries.name asc").map {|c| ["#{c.sector.name}:#{c.name}", c.id] }}, :if => :show_industry)
  #filter(:condition3, :dynamic)
  #filter(:condition4, :dynamic)
  #filter(:condition5, :dynamic)
  #filter(:condition6, :dynamic)

  column(:symbol, :header => "Sym", :html => true) do |stock|
	  link_to stock.symbol, "/stocks/#{stock.id}"
  end
  column(:name, :html => true) do |stock|
	  link_to stock.name, stock_path(stock)
  end
  column(:industry, :order => "industries.name") do
	  self.industry.name
  end
  column(:sector, :order => "sectors.name") do
	  self.sector.name
  end

  column(:price) do
    self.close
  end

  column(:div_yield) do
    self.stat.dividend_yield
  end

  column(:p_e) do
    self.stat.pe_ratio
  end
end
