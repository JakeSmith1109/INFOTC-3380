//list all zip codes and cities from your home state (IL)
db.zips.find({"state": "IL"},{"city":1})

//list all of the zip codes and cities from the states of MO, FL, IA, KS
db.zips.find({$or: [{"state": "MO"},{"state": "FL"},{"state": "IA"},{"state": "KS"}]},{"city":1, "state":1})

//list the zip codes, city, and population in ohio for all the zip codes with populations of less than 2000 people
db.zips.find({$and: [{"state": "OH"},{"pop": {$lt:200}}]},{"city":1, "pop":1})

//list the zip codes, city, and population for zip codes in the US that have populations greater than 50k people
db.zips.find({"pop": {$gt:50000}},{"city":1, "pop":1})

//which zip codes are located in Columbia, MO?
db.zips.find({$and: [{"state": "MO"},{"city": "COLUMBIA"}]},{"_id":1})

//list the population by zip code for all zip codes in MO
db.zips.find({"state": "MO"},{"pop":1})

//which states have cities named Springfield?
db.zips.find({"city": "SPRINGFIELD"},{"state":1, "_id":0})

//how many cities named Springfield are there in the US?
db.zips.find({"city": "SPRINGFIELD"}).count()

//list the zip code, population, and state for cities named Emerald
db.zips.find({"city": "EMERALD"},{"pop":1, "state":1})

//list the zip code, city, and state for cities with a population of 10 people
db.zips.find({"pop": 10},{"city":1, "state":1})

//list all of the documents in the stocks collection
db.stocks.find()

//list the company name and symbol for all companies in the "Information Technology" sector
db.stocks.find({"Sector": "Information Technology"},{"Name":1, "_id":0, "Symbol":1})

//list the symbol, company name, and stock price for all companies in the "Financials" sector whose stock price is > 75
db.stocks.find({$and: [{"Sector": "Financials"},{"Price": {$gt:75}}]},{"_id":0, "Symbol":1, "Name":1, "Price":1})

//list the company name, sector, and earnings for all companies with earnings of at least 2.5 billion
db.stocks.find({"EBITDA": {$gte: 2500000000}},{"_id":0, "Name":1, "Symbol":1, "EBITDA":1})

//list the company name, symbol, and sector for all companies with a 52 week high greater than or equal to 150
db.stocks.find({"52 Week High": {$gte:150}},{"_id":0, "Name":1, "Symbol":1, "Sector":1})

//list the symbol, company name, and stock price for all companies in the "Real Estate" sector whose stock price is less than 50
db.stocks.find({$and: [{"Price": {$lt:50}},{"Sector": "Real Estate"}]},{"_id":0, "Name":1, "Symbol":1, "Price":1})

//list the company name, symbol, and dividend yield for companies in the Utilities or Industrials sectors
db.stocks.find({$or: [{"Sector": "Utilities"},{"Sector": "Industrials"}]},{"_id":0, "Name":1, "Symbol":1, "Dividend Yield":1})

//list the company name, symbol, and market cap for companies whose dividend yield is greater than 3 or whose earnings/share is less than 1
db.stocks.find({$or: [{"Dividend Yield": {$gt:3}},{"Earnings/Share": {$lt:1}}]},{"_id":0, "Name":1, "Symbol":1, "Market Cap":1})