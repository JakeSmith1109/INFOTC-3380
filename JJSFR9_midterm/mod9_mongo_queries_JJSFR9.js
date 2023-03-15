//how many orders has each order line appeared in?
//display order line number and number of orders in "NumberOfOrders"
//descending
db.orders.aggregate([
    {$unwind:"$orderDetails"},
    {$group:{_id:"$orderDetails.orderLineNumber", NumberOfOrders:{$sum:1}}},
    {$sort:{NumberOfOrders:-1}}
])

//calculate the total payments each customer has made
//display customer name and total payment in "TotalPayments"
//descending
db.customers.aggregate([
    {$unwind:"$payments"},
    {$group:{_id:"$customerName", TotalPayments:{$sum:"$payments.amount"}}},
    {$sort:{TotalPayments:-1}}
])

//calculate the number of payments each customer has made
//display the customer name and the number of payments in "NumberOfPayments"
//descending
db.customers.aggregate([
    {$unwind:"$payments"},
    {$group:{_id:"$customerName", NumberOfPayments:{$sum:1}}},
    {$sort:{NumberOfPayments:-1}}
])

//number of employees working in each office
//list office code and number of employees in "NumberOfEmployees"
//descending
db.employees.aggregate([
    {$group:{_id:"$office.officeCode", NumberOfEmployees:{$sum:1}}},
    {$sort:{NumberOfEmployees:-1}}
])

//10 most expensive orders
//display customer name and order total
//display OrderTotal descending and limit 10
db.orders.aggregate([
    {$unwind:"$orderDetails"},
    {$group:{_id:"$_id", customerName:{$addToSet:"$customerName"}, OrderTotal:{$sum:{$multiply:["$orderDetails.quantityOrdered","$orderDetails.priceEach"]}}}},
    {$project:{_id:1, customerName:1, OrderTotal:1}},
    {$sort:{OrderTotal:-1}},
    {$limit:10}
])

//sales value of each product in stock
//display product name and sales value in "SalesValue"
//descending
db.products.aggregate([
    {$group:{_id:"$productName", SalesValue:{$sum:{$multiply:["$quantityInStock","$MSRP"]}}}},
    {$sort:{SalesValue:-1}}
])

//customer that has ordered the most 1913 Ford Model T Speedster
//display customer name and TotalFMTOrdered
db.orders.aggregate([
    {$unwind:"$orderDetails"},
    {$match:{"orderDetails.productName":"1913 Ford Model T Speedster"}},
    {$group:{_id:"$customerName", TotalFMTOrdered:{$sum:"$orderDetails.quantityOrdered"}}},
    {$sort:{TotalFMTOrdered:-1}},
    {$limit:1}
])

//how many customers does each sales rep have?
//display sales rep name and number of customers in "TotalCustomers"
db.customers.aggregate([
    {$group:{_id:"$salesRep", TotalCustomers:{$sum:1}}}
])