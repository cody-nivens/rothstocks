class IndustriesGrid < BaseGrid

  scope do
	  Industry.includes(:sector)
  end

  filter(:sector, :string)
  filter(:sector_id, :integer)

  column(:sector, :order => "sectors.name") do
	  self.sector.name
  end
  column(:name, :order => "industries.name")


  column(:stocks) do |sec|
    sec.stocks.count
  end

end
