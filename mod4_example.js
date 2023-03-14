//return all documents in a collection
db.zips.find()
db.zips.find({},{}) //same output

//return all documents in zips collection in a more readable format
db.zips.find().pretty()

//general query format: db.*collection*.find({query filter parameter (WHERE)},{display key values (SELECT)})

//display the city names and zip codes for the state of Missouri
db.zips.find({"state": "MO"},{"_id":1, "city":1, "state":1})
// don't necessarily need id, will display by default

//do not display the id
db.zips.find({"state": "MO"},{"_id":0, "city":1, "state":1})
//just change id to 0

//how many zip codes are in the state of New York
db.zips.find({"state": "NY"}).count()

//list all cities and zip codes from MO, KS, and IL
db.zips.find({$or:[{"state": "MO",},{"state": "KS"},{"state": "IL"}]},{"_id":1, "city":1, "state":1})

//display zip codes, city, and state from states where population is less than or equal to 500
db.zips.find({"pop": {$lte:500}}, {"_id":1, "city":1, "state":1, "pop":1})

//display stocks name, earnings per share, sector if the price is >= 100
db.stocks.find({"Price": {$gte:100}}, {"_id":0, "Name":1, "Earnings/Share":1, "Sector":1})