after :users do
  user = User.find_by(email: 'palo@alto.com')
  portfolio = user.portfolio[0]

  ['KO','AAPL','PG','JNJ'].each do |sym|
    stock = Stock.find_by(symbol: sym)
    portfolio.holdings << Holding.create(holding: stock, price: stock.price*100, quantity: 100, date: Date.today)
  end
  portfolio = Portfolio.create(name: "Portfolio 2", user_id: user.id)
  
  ['FRT','TGT','CWT','CINF'].each do |sym|
    stock = Stock.find_by(symbol: sym)
    portfolio.holdings << Holding.create(holding: stock, price: stock.price*100, quantity: 100, date: Date.today)
  end

  user2 = User.find_by(email: 'jalo@alto.com')
  portfolio = Portfolio.create(name: "Portfolio 1", user_id: user2.id)

  ['FRT','TGT','CWT','CINF'].each do |sym|
    stock = Stock.find_by(symbol: sym)
    portfolio.holdings << Holding.create(holding: stock, price: stock.price*100, quantity: 100, date: Date.today)
  end
  portfolio = Portfolio.create(name: "Portfolio 2", user_id: user2.id)
  
  ['KO','AAPL','PG','JNJ'].each do |sym|
    stock = Stock.find_by(symbol: sym)
    portfolio.holdings << Holding.create(holding: stock, price: stock.price*100, quantity: 100, date: Date.today)
  end
end
