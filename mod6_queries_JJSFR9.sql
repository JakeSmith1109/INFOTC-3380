--calculate the number of orders for each product that has been ordered
--display product name and number of orders in a column called "Number of orders"
--descending order
SELECT p.productName, COUNT(o.orderNumber) AS "Number of Orders"
FROM products p, orderdetails o
WHERE p.productCode = o.productCode
GROUP BY productName
ORDER BY COUNT(o.orderNumber) DESC;

--calculate the total number of each product that has been ordered
--display product name and quantity ordered in column called "quantity ordered"
--descending order
SELECT p.productName, SUM(o.quantityOrdered) AS "Number of Orders"
FROM products p, orderdetails o
WHERE p.productCode = o.productCode
GROUP BY productName
ORDER BY SUM(o.quantityOrdered) DESC;

--calculate the total dollar value of the top 25 products
--display product name and dollar value in a column called "total value"
SELECT p.productName, SUM(o.quantityOrdered * o.priceEach) AS "Total Value"
FROM products p, orderdetails o
WHERE p.productCode = o.productCode
GROUP BY p.productName
ORDER BY SUM(o.quantityOrdered * o.priceEach) DESC
LIMIT 25;

--calculate the number of orders each customer has placed
--display top 25 in descending order based on orders placed
--display customer name and orders placed in "orders placed"
SELECT c.customerName, COUNT(o.orderNumber)
FROM customers c, orders o
WHERE c.customerNumber = o.customerNumber
GROUP BY c.customerName
ORDER BY COUNT(o.orderNumber) DESC
LIMIT 25;

--calculate the total payments made each year
--display the year and total payments in a column called "total payments"
SELECT YEAR(paymentDate) AS "Year", SUM(amount) AS "Total Payments"
FROM payments
GROUP BY YEAR(paymentDate);

--calculate the total payments made each month in 2004
--display the month and total payments in "total payments"
--ascending order
SELECT MONTH(paymentDate) AS "Month", SUM(amount) AS "Total Payments"
FROM payments
WHERE YEAR(paymentDate) = 2004
GROUP BY MONTH(paymentDate)
ORDER BY MONTH(paymentDate) ASC;

--calculate the total payments made each day in december of 2004
--display the day in a column named "day" and total payments in "total payments"
--order result by day in ascending order
SELECT DAY(paymentDate) AS "Day", SUM(amount) AS "Total Payments"
FROM payments
WHERE YEAR(paymentDate) = 2004 AND MONTH(paymentDate) = 12
GROUP BY DAY(paymentDate)
ORDER BY DAY(paymentDate) ASC;

--calculate the total payments made by each customer in the database who has made a payment
--display the customer name and total payments in "total payments"
--order results by total payments descending
SELECT c.customerName, SUM(p.amount) AS "Total Payments"
FROM customers c, payments p
WHERE c.customerNumber = p.customerNumber
GROUP BY customerName
ORDER BY SUM(p.amount) DESC;

--calculate and display the number of customers in each state
--display state name and number of customers in "number of customers in state"
--order results by number of customers in state descending
SELECT COUNT(c.customerNumber) AS "Number of Customers in State", c.state
FROM customers c
GROUP BY c.state
ORDER BY COUNT(customerNumber) DESC; 
--cannot figure out why there is a NULL row with a count of 73, have tried
--multiple different things but this one shows the rest of the info
--correctly but includes the null row

--calculate the number of people that each employee manages
--display employee number and number of employees they manage in "number of reports"
SELECT reportsTo, COUNT(employeeNumber) AS "Number of Reports"
FROM employees
GROUP BY reportsTo; 

--calculate the number of product lines in the database
--display in a column called "number of lines"
SELECT COUNT(productLine) AS "Number of Lines"
FROM productlines;

--calculate the dollar value of each product in iventory
--display product name, quantity in stock, buy price
--dollar value in column called "dollar value"
--descending order based on dollar value
SELECT productName, quantityInStock, buyPrice, SUM(quantityInStock * buyPrice) AS "Dollar Value"
FROM products
GROUP BY productName, quantityInStock, buyPrice
ORDER BY SUM(quantityInStock * buyPrice) DESC;