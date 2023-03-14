//how many products are in the products collection
//name the field "number of products"
db.products.aggregate([
    {$group:{_id:"productName", NumberOfProducts:{$sum:1}}},
    {$project:{"_id":0}}
])

//calculate the number of orders each sales rep has placed
//display the top 12 in descending order
//name field "orders placed"
db.orders.aggregate([
    {$group:{_id:"$salesRep", OrdersPlaced:{$sum:1}}},
    {$project:{OrdersPlaced:1, _id:1}},
    {$sort:{OrdersPlaced:-1}},
    {$limit:12}
])

//list the product names and quantity in stock for products where
//the quantity in stock is <= 1000
//sort descending
db.products.aggregate([
    {$match:{quantityInStock:{$lte:1000}}},
    {$project:{"productName":1,"quantityInStock":1,"_id":0}},
    {$sort:{quantityInStock:-1}}
])

//calculate and display number of customers in each state
//name the column "total customers" and sort ascending
db.customers.aggregate([
    {$group:{_id:"$state", totalCustomers:{$sum:1}}},
    {$project:{"_id":0, totalCustomers:1, _id:1}},
    {$sort:{totalCustomers:1}}
])

//which employees manage the most people
//display employee name and number of employees
//name column "Number of Reports"
db.employees.aggregate([
    {$group:{_id:"$reportsTo", NumberOfReports:{$sum:1}}},
    {$project:{"_id":0, _id:1, NumberOfReports:1}}
])

//list the names and credit limit of the customers with 10 lowest credit limits
//name column creditLimit sort asc
db.customers.aggregate([
    {$project:{"_id":0, "customerName":1, "creditLimit":1}},
    {$sort:{creditLimit:1}},
    {$limit:10}
])

//calculate the number of products each vendor supplies
//name field "numberOfProducts" sort descending
db.products.aggregate([
    {$group:{_id:"$productVendor", numberOfProducts:{$sum:1}}},
    {$project:{"_id":0, _id:1, numberOfProducts:1}},
    {$sort:{numberOfProducts:-1}}
])

//calculate the dollar value of each product in inventory
//display product name, quantity in stock, buy price, and dollar value
//name column "DollarValue" and sort descending
db.products.aggregate([
    {$project:{"_id":0, "productName":1, "quantityInStock":1, "buyPrice":1, DollarValue:{$multiply:["$quantityInStock", "$buyPrice"]}}},
    {$sort:{DollarValue:-1}}
])