class HoldingsGrid < BaseGrid

  scope do
    Holding
  end

  filter(:holding, :string)

  column(:holding, :html => true) do |holding|
	  link_to "#{holding.holding.symbol} #{holding.holding.name}", "/holdings/#{holding.id}"
  end
  column(:price)
  column(:quantity)
  column(:value)
  date_column(:date)
  column(:price2, :html => true) do |price2|
    line_chart DividendRank.where(stock_id: price2.holding.id).group_by_month(:date).pluck(:date,:price), width: "289px", height: "150px"
  end
end
