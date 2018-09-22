class DividendRanksGrid < BaseGrid

  scope do
    DividendRank.includes(:stock) 
  end

  column(:ccc_seq, :header => "CCC")

  column(:date, :header => "Date")

  column(:symbol, :header => "Sym", :html => true) do |dividend_rank|
	  link_to @stock.symbol, "stocks/#{@stock.id}"
  end
  column(:name, :html => true) do |stock|
	  link_to @stock.name, "stocks/#{@stock.id}"
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
	  "%.2f" %  self.peg_ratio unless self.peg_ratio.nil?
  end
  column(:yield_years, :header => "Years") do
          "% d" %  self.yield_years
  end
  column(:last_5_growth, :header => "Last 5 Growth") do
	  "%.2f" %  self.last_5_growth unless self.last_5_growth.nil? 
  end
  column(:est_5_growth, :header => "Ext 5 Growth") do
	  "%.2f" %  self.est_5_growth unless self.est_5_growth.nil?
  end
  column(:actions, :html => true ) do |dividend_rank|
	  link_to "View", "/dividend_ranks/#{dividend_rank.id}"
  end
end
