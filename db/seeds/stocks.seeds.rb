require 'json'

after :sectors, :industries do
  file = File.read(Rails.root.join('db', 'seeds', 'symbols.json'))
  data_hash = JSON.parse(file)

  data_hash.each do |row|
    next unless row['type'] == 'cs'
    stock = Stock.create(name: row['name'], symbol: row['symbol'])
  end

end
