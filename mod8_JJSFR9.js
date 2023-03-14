//calculate the number of orders for each product that has been ordered
//display product name and number of orders in a column called "Number of orders"
//descending order
db.orders.aggregate([
    {$unwind:"$orderDetails"},
    {$group:{_id:"$orderDetails.productName", NumberOfOrders: {$sum:1}}},
    {$sort:{NumberOfOrders:-1}}
])

//calculate the total number of each product that has been ordered
//display product name and quantity ordered in column called "quantity ordered"
//descending order
db.orders.aggregate([
    {$unwind:"$orderDetails"},
    {$group:{_id:"$orderDetails.productName", QuantityOrdered:{$sum:"$orderDetails.quantityOrdered"}}},
    {$sort:{QuantityOrdered:-1}}
])

//calculate the total dollar value of the top 25 products
//display product name and dollar value in a column called "total value"
db.orders.aggregate([
    {$unwind:"$orderDetails"},
    {$group:{_id:"$orderDetails.productName", TotalValue:{$sum:{$multiply:["$orderDetails.quantityOrdered","$orderDetails.priceEach"]}}}},
    {$sort:{TotalValue:-1}},
    {$limit:25}
])

//calculate the number of orders each customer has placed
//display top 25 in descending order based on orders placed
//display customer name and orders placed in "orders placed"
db.customers.aggregate([
    {$unwind:"$payments"},
    {$group:{_id:"$customerName", OrdersPlaced:{$sum:1}}},
    {$sort:{OrdersPlaced:-1}},
    {$limit:25}
])

//calculate the total payments made each year
//display the year and total payments in a column called "total payments"
db.customers.aggregate([
    {$unwind:"$payments"},
    {$addFields:{"year": {$year:"$payments.paymentDate"}}},
    {$group:{_id:"$year", TotalPayments:{$sum:"$payments.amount"}}},
    {$sort:{_id:1}}
])

//calculate the total payments made each month in 2004
//display the month and total payments in "total payments"
//ascending order
db.customers.aggregate([
    {$unwind:"$payments"},
    {$addFields:{"year": {$year:"$payments.paymentDate"}, "month": {$month:"$payments.paymentDate"}}},
    {$match:{"year":2004}},
    {$group:{_id:"$month", TotalPayments:{$sum:"$payments.amount"}}},
    {$sort:{_id:1}}
])

//calculate the total payments made each day in december of 2004
//display the day in a column named "day" and total payments in "total payments"
//order result by day in ascending order
db.customers.aggregate([
    {$unwind:"$payments"},
    {$addFields:{"year":{$year:"$payments.paymentDate"}, "month":{$month:"$payments.paymentDate"}, "day":{$dayOfMonth:"$payments.paymentDate"}}},
    {$match:{"year":2004, "month":12}},
    {$group:{_id:"$day", TotalPayments:{$sum:"$payments.amount"}}},
    {$sort:{_id:1}}
])

//calculate the total payments made by each customer in the database who has made a payment
//display the customer name and total payments in "total payments"
//order results by total payments descending
db.customers.aggregate([
    {$unwind:"$payments"},
    {$group:{_id:"$customerName", TotalPayments:{$sum:"$payments.amount"}}},
    {$sort:{TotalPayments:-1}}
])

//calculate and display the number of customers in each state
//display state name and number of customers in "number of customers in state"
//order results by number of customers in state descending
db.customers.aggregate([
    {$unwind:"$payments"},
    {$group:{_id:"$state", NumberOfCustomersInState:{$sum:1}}},
    {$sort:{NumberOfCustomersInState:-1}}
])//values are tripled from example output and cannot figure out why

//calculate the number of people that each employee manages
//display employee number and number of employees they manage in "number of reports"
db.employees.aggregate([
    {$group:{_id:"$reportsTo", NumberOfReports:{$sum:1}}}
])

//calculate the number of product lines in the database
//display in a column called "number of lines"
db.products.aggregate([
    {$unwind:"$productLine"},
    {$group:{_id:"$productLine.line", NumberOfLines:{$sum:1}}}
])

//calculate the dollar value of each product in inventory
//display product name, quantity in stock, buy price
//dollar value in column called "dollar value"
//descending order based on dollar value
db.products.aggregate([
    {$group:{_id:"$productName", DollarValue:{$sum:{$multiply:["$quantityInStock","$buyPrice"]}}}},
    {$sort:{DollarValue:-1}}
])