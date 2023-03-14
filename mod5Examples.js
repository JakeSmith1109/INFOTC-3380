//list the 10 most expensive stocks in the stocks collection
//sort by price in descending order
db.stocks.aggregate([
    {$sort: {"Price": -1}}, //-1 for descending and 1 is ascending
    {$limit: 10},
    {$project: {"Symbol":1, "Name":1, "Price":1, "_id":0}}
])

//list the population for the 10 least populous cities in MO
db.zips.find({"state": "MO", "city": "COLUMBIA"}).pretty()

//documents where state is MO - $match
//group documents based on the city field, and sum the populations - $group, $sum
//sort by total population - $sort
//limit to 10 - $limit
db.zips.aggregate([
    {$match: {state: "MO"}}, //denote only MO cities
    {$group: {_id:"$city", TotalPopulation:{$sum: "$pop"}}}, //group cities with multiple zip codes into "TotalPopulation" and sum the zips for one city
    {$sort: {TotalPopulation:1}},
    {$limit:10}
])

//same thing but gte 25000 with no $limit
db.zips.aggregate([
    {$match: {state: "MO"}}, //denote only MO cities
    {$group: {_id:"$city", TotalPopulation:{$sum: "$pop"}}}, //group cities with multiple zip codes into "TotalPopulation" and sum the zips for one city
    {$match: {TotalPopulation: {$gte:25000}}}, //can use the same function more than once
    {$sort: {TotalPopulation:1}},
])

//how many zip codes in the state of FL?
db.zips.aggregate([
    {$match: {state: "FL"}},
    {$count: "Total Zips in Florida"}
])

//another way to do same thing, however not in the document format
db.zips.find({"state": "FL"}).count()

//difference between $sum and $count
//display the total population of Columbia, MO
db.zips.aggregate([
    {$match: {state: "MO", city: "COLUMBIA"}},
    {$group: {_id:"$city", TotalPopulation:{$sum: "$pop"}}} //can use $group without $sum, but not $sum without $group
])

//display the number of zip codes in Columbia, MO
db.zips.aggregate([
    {$match: {state: "MO", city:"COLUMBIA"}},
    {$count: "Total Zips in Columbia"}
]) //one group in pipeline

db.zips.aggregate([
    {$match: {state: "MO", city: "COLUMBIA"}},
    {$group: {_id:"$city", NumZips:{$sum:1}}} //putting 1 here adds one to the field "NumZips" for every zip code. produces same output as above
]) //multiple groups in pipeline

//example of above query
db.zips.aggregate([
    {$match: {state: "MO"}},
    {$group: {_id:"$city", NumZips:{$sum:1}}} 
])

db.zips.aggregate([
    {$match: {state: "MO"}},
    {$count: "Total Zips in Columbia"}
])

//list cities in IL that have 3 or more zips
//sort in descending order based on total zips
//count the occurrence of a city's name in the document
//match state = IL
//group by city and count the number of zip codes in each group
//match zips > 3
//sort -1
db.zips.aggregate([
    {$match: {state: "IL"}},
    {$group: {_id:"$city", NumZips:{$sum:1}}},
    {$match: {NumZips:{$gt:3}}},
    {$sort: {NumZips: -1}}
])