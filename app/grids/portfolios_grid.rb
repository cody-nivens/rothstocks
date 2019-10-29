class PortfoliosGrid < BaseGrid

  scope do
	  Portfolio
  end

  column(:name, :html => true) do |portfolio|
          link_to portfolio.name, "portfolios/#{portfolio.id}"
  end
  column(:holdings) do |portfolio|
    portfolio.holdings.count
  end
  column(:cost, :html => true) do |holding|
    number_to_currency(holding.cost)
  end
  column(:value, :html => true) do |holding|
    number_to_currency(holding.value)
  end
  column(:div_value, :html => true) do |holding|
    number_to_currency(holding.div_value)
  end

end
