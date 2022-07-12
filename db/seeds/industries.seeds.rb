require 'csv'

after :sectors do
if Industry.count == 0
  CSV.foreach(Rails.root.join('db', 'seeds', 'sector_industries.csv'), headers: true) do |row|
    s = Industry.new
    s.name = row['name']
    s.sector_id = Sector.find_by_name(row['sector']).id
    s.save
  end
end
end

