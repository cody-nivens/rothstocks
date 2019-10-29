class SectorsGrid < BaseGrid

  scope do
    Sector
  end


  column(:name, :html => true) do |sector|
     link_to sector.name, "sectors/#{sector.id}"
  end

  column(:industries) do |sec|
    sec.industries.count
  end

  column(:stocks) do |sec|
    sec.stocks.count
  end
end
