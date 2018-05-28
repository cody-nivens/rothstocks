class IndustriesGrid < BaseGrid

  scope do
	  Industry.includes(:sector)
  end

  filter(:sector, :string)

  column(:name)
  column(:sector, :order => "sectors.name, industries.name") do
	  self.sector.name
  end
end
