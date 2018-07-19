class PortfoliosGrid < BaseGrid

  scope do
	  Portfolio
  end

  column(:name, :html => true) do |portfolio|
          link_to portfolio.name, "portfolios/#{portfolio.id}"
  end
  column(:cost)
  column(:value)

end
