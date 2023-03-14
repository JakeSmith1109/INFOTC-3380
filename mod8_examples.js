//use the unwind function to unwind on the payments field for a customer
db.customers.aggregate([
    {$unwind:"$payments"},
    {$match: {"customerName": "Toys4GrownUps.com"}}
]).pretty() //fields to the right of colon need $, fields to the left do not

//count the number of payments from the same customer
db.customers.aggregate([
    {$unwind: "$payments"},
    {$match: {"customerName": "Toys4GrownUps.com"}},
    {$count: "Number of Payments"}
])

//count the number of payments for all customers
db.customers.aggregate([
    {$unwind: "$payments"},
    {$count: "Number of Payments (all customers)"}
])

//calculate the total dollar value of payments made by same customer
db.customers.aggregate([
    {$unwind: "$payments"},
    {$match: {"customerName": "Toys4GrownUps.com"}},
    {$group: {_id:"$customerName", totalPayments: {$sum:"$payments.amount"}}}
]) //to use sum it must be in group stage

//calculate the total dollar value of payments made by each customer
db.customers.aggregate([
    {$unwind: "$payments"},
    {$group: {_id:"$customerName", totalPayments: {$sum:"$payments.amount"}}}
])

//calculate the total dollar value, number of payments,
//and avg payments made by each customer
db.customers.aggregate([
    {$unwind: "$payments"},
    {$group: {_id:"$customerName", totalPayments:{$sum:"$payments.amount"}, numberOfPayments:{$sum:1}, averagePayment:{$avg:"$payments.amount"}}},
    //{$match: {totalPayments:{$gte:100000}}}
]).pretty()

//count the number of employees in the USA
db.employees.aggregate([
    {$match: {"office.country": "USA"}},
    {$count: "Number of USA Employees"}
]) 
//do not need to unwind office because they are nested values,
//only need to unwind on a list of nested documents
//for nested values, can get to them by [outer value].[inner value]
//example: office.country

//display the customer name, total payments,
//avg payment, number of payments, and sales rep name for customers
//with total payments gte 100k
db.customers.aggregate([
    {$unwind: "$payments"},
    {$group: {_id:"$customerName", 
        totalPayments:{$sum:"$payments.amount"}, 
        numberOfPayments:{$sum:1}, 
        averagePayment:{$avg:"$payments.amount"},
        salesRep: {$addToSet:"$salesRep"}}},
    {$match: {totalPayments:{$gte:100000}}}
]).pretty()

//date functions
//get orders made in the year 2003
db.orders.aggregate([
    {$addFields: {"year": {$year: "$orderDate"}, "month": {$month: "$orderDate"}, "day": {$dayOfMonth: "$orderDate"}}},
    {$match: {"year":2003}}
]).pretty()

//how many orders placed in 2003
db.orders.aggregate([
    {$addFields: {"year": {$year: "$orderDate"}, "month": {$month: "$orderDate"}, "day": {$dayOfMonth: "$orderDate"}}},
    {$match: {"year":2003}},
    {$count: "Number of Orders in 2003"}
]).pretty()

//how many orders were placed in november of 2003
db.orders.aggregate([
    {$addFields: {"year": {$year: "$orderDate"}, "month": {$month: "$orderDate"}, "day": {$dayOfMonth: "$orderDate"}}},
    {$match: {"year":2003, "month":11}},
    {$count: "Number of Orders in November 2003"}
]).pretty()