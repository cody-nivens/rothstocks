after :users do
  user = User.find_by(email: 'palo@alto.com')
  portfolio = Portfolio.create(name: "First pass at Roth", user_id: user.id)

  ['KO','AAPL','PG','JNJ'].each do |sym|
    stock = Stock.find_by(symbol: sym)
    dividend_rank = stock.dividend_rank.last

    portfolio.holdings << Holding.create(held: stock, price: dividend_rank.price*100, quantity: 100, date: dividend_rank.ex_div - 1.day)
  end
  portfolio = Portfolio.create(name: "Portfolio 2", user_id: user.id)
  
  ['FRT','TGT','CWT','CINF'].each do |sym|
    stock = Stock.find_by(symbol: sym)
    dividend_rank = stock.dividend_rank.last

    portfolio.holdings << Holding.create(held: stock, price: dividend_rank.price*100, quantity: 100, date: dividend_rank.ex_div - 1.day)
  end

  user2 = User.find_by(email: 'jalo@alto.com')
  portfolio = Portfolio.create(name: "Portfolio 1", user_id: user2.id)

  ['FRT','TGT','CWT','CINF'].each do |sym|
    stock = Stock.find_by(symbol: sym)
    dividend_rank = stock.dividend_rank.last

    portfolio.holdings << Holding.create(held: stock, price: dividend_rank.price*100, quantity: 100, date: dividend_rank.ex_div - 1.day)
  end
  portfolio = Portfolio.create(name: "Portfolio 2", user_id: user2.id)
  
  ['KO','AAPL','PG','JNJ'].each do |sym|
    stock = Stock.find_by(symbol: sym)
    dividend_rank = stock.dividend_rank.last

    portfolio.holdings << Holding.create(held: stock, price: dividend_rank.price*100, quantity: 100, date: dividend_rank.ex_div - 1.day)
  end
end
