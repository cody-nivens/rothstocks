class HoldingsGrid < BaseGrid

  # Disable default order
  #self.default_column_options = { :order => false }

  scope do
    Holding.joins(:stock)
  end

  column(:name, :html => true, :order => "stocks.name", :descending => true) do |holding|
	  link_to "#{holding.stock.name}", holding_path(holding)
  end

  column(:symbol, :html => true, :order => "stocks.symbol") do |holding|
	  link_to "#{holding.stock.symbol}", holding_path(holding)
  end

  column(:price, :html => true) do |holding|
    number_to_currency(holding.price)
  end

  column(:quantity)

  column(:value, :html => true) do |holding|
    number_to_currency(holding.value)
  end

  column(:gain, :html => true) do |holding|
    number_to_currency(holding.value - holding.price) unless holding.value.nil?
  end
  date_column(:date)

  column(:sector) do |holding|
    holding.stock.sector.name
  end

  column(:industry) do |holding|
    holding.stock.industry.name
  end

  column(:new_rate) do |holding|
    "%.2f" % holding.stock.dividend_ranks.last.new_rate
  end

  column(:dividend_value) do |holding|
    "%.2f" % holding.div_value
  end
  column(:stock_value) do |holding|
    "%.7f" % ( holding.div_value / holding.stock.quote["latest_price"] )
  end
  column(:actions, :html => true ) do |holding|
     link_to "Delete", holding_path(holding), :method => "delete", data: { confirm: "Are you sure?" }
  end

#  column(:price2, :html => true) do |price2|
#    line_chart DividendRank.where(stock_id: price2.stock.id).group_by_month(:date).pluck(:date,:price), width: "289px", height: "150px"
#  end
end
