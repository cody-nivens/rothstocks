class PortfoliosGrid < BaseGrid

  scope do
	  Portfolio
  end

  column(:id)
  column(:name, :html => true) do |portfolio|
          link_to portfolio.name, "portfolios/#{portfolio.id}"
  end
  column(:user) do
	  self.user.email
  end

  date_column(:created_at)
end
