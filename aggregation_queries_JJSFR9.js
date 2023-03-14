//which states have zip codes with populations greater than 75k people
db.zips.aggregate([
    {$match: {pop:{$gt:75000}}},
    {$project: {"state":1, "_id":0}}
])

//which cities have populations greater than 200k people
db.zips.aggregate([
    {$group: {_id:"$city", TotalPopulation:{$sum:"$pop"}}},
    {$match: {TotalPopulation:{$gt:200000}}}
])

//what is the total population of each city in FL sorted in ascending order
db.zips.aggregate([
    {$match: {state:"FL"}},
    {$group: {_id:"$city", TotalPopulation:{$sum:"$pop"}}},
    {$sort: {totalPop:1}},
])

//what are the 10 most populous cities in MO
db.zips.aggregate([
    {$match: {state:"MO"}},
    {$group: {_id:"$city", TotalPopulation:{$sum:"$pop"}}},
    {$sort: {TotalPopulation:-1}},
    {$limit:10}
])

//what is the population of NYC
db.zips.aggregate([
    {$match: {city: "NEW YORK"}},
    {$group: {_id:"$city", TotalPopulation:{$sum:"$pop"}}},
])

//list the cities in IL that have 3 or more zip codes by descending order
//by total number of zip codes
db.zips.aggregate([
    {$match: {state:"IL"}},
    {$group: {_id:"$city", TotalZips:{$sum:1}}},
    {$match: {TotalZips:{$gte:3}}},
    {$sort: {TotalZips:-1}}
])

//which city has the fewest number of zip codes
db.zips.aggregate([
    {$group: {_id:"$city", TotalZips:{$sum:1}}},
    {$sort: {TotalZips:1}},
    {$limit:1}
])

//what is the name and total population of the most populous city
db.zips.aggregate([
    {$group: {_id:"$city", TotalPopulation:{$sum:"$pop"}}},
    {$sort: {TotalPopulation:-1}},
    {$limit:1}
])

//what is the name and total population of the least populous city
db.zips.aggregate([
    {$group: {_id:"$city", TotalPopulation:{$sum:"$pop"}}},
    {$sort: {TotalPopulation:1}},
    {$limit:1}
])

//what is the name and total population for the 15 most populous cities 
db.zips.aggregate([
    {$group: {_id:"$city", TotalPopulation:{$sum:"$pop"}}},
    {$sort: {TotalPopulation:-1}},
    {$limit:15}
])

//list the symbol and company name of the companies with the 10 highest
//stock prices
db.stocks.aggregate([
    {$sort: {"Price": -1}},
    {$limit: 10},
    {$project: {"Symbol":1, "Name":1, "_id":0}}
])

//list the total earnings (EBITDA) by sector
db.stocks.aggregate([
    {$group: {_id:"$Sector", TotalEarnings:{$sum:"$EBITDA"}}},
])

//list the average earnings by sector
db.stocks.aggregate([
    {$group: {_id:"$Sector", AverageEarnings:{$avg:"$EBITDA"}}}
])

//show the company name and symbol of the top 10 companies in earnings in
//the Industrials sector
db.stocks.aggregate([
    {$match: {Sector:"Industrials"}},
    {$sort: {"EBITDA":-1}},
    {$limit:10},
    {$project: {"Name":1, "Symbol":1, "_id":0}}
])

//list the names of the companies in the IT sector that paid dividends to 
//shareholders (if "dividend yield" is > 0)
db.stocks.aggregate([
    {$match: {Sector:"Information Technology"}},
    {$match: {"Dividend Yield":{$gt:0}}},
    {$project: {"Name":1, "_id":0}}
])

//calculate the total earnings (EBITDA) for all companies in the IT sector
db.stocks.aggregate([
    {$match: {Sector:"Information Technology"}},
    {$group: {_id:"$Information Technology", TotalEarnings:{$sum:"$EBITDA"}}},
    {$project: {TotalEarnings:1, "_id":0}}
])

//calculate the number of outstanding shares for companies in the
//industrials sector. number of outstanding shares can be calculated by 
//dividing the market cap by the price. display company name, symbol, 
//and number of outstanding shares in ascending order

db.stocks.aggregate([
    {$match: {Sector:"Industrials"}},
    {$group: {_id:"$Industrials", OutstandingShares:{$divide:["$Market Cap","$Price"]}}},
    {$project: {"Name":1, "Symbol":1, OutstandingShares:1, "_id":0}}
])

//have tried extensively to figure out the issue with the divide operator,
//cannot figure it out, but the query above is my best and most logical 
//guess