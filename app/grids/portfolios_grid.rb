class PortfoliosGrid < BaseGrid

  scope do
    Portfolio
  end

  filter(:id, :integer)
  filter(:created_at, :date, :range => true)

  column(:id)
  column(:name, :html => true) do |portfolio|
          link_to portfolio.name, "portfolios/#{portfolio.id}"
  end

  date_column(:created_at)
end
