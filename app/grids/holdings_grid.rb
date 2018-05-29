class HoldingsGrid < BaseGrid

  scope do
    Holding
  end

  filter(:holding, :string)

  column(:id)
  column(:holding, :html => true) do |holding|
	  link_to "#{holding.holding.symbol} #{holding.holding.name}", "/holdings/#{holding.id}"
  end
  column(:price)
  column(:quantity)
  date_column(:date)
end
