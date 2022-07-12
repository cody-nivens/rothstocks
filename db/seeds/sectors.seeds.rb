require 'csv'

if Sector.count == 0
  CSV.foreach(Rails.root.join('db', 'seeds', 'sectors.csv'), headers: true) do |row|
    s = Sector.new
    s.name = row['name']
    s.save
  end
end


