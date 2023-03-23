--SUBQUERIES

--show the customer number, name, payment date, and payment amount for 
--payments greater than the average payment
SELECT c.customerNumber, c.customerName, p.paymentDate, p.amount
FROM customers c, payments p 
HAVING p.amount > (SELECT AVG(amount) FROM payments);

--generate a list of managers. show their employee number, first and last name
SELECT employeeNumber, firstName, lastName
FROM employees
WHERE jobTitle IN (SELECT jobTitle FROM employees WHERE jobTitle LIKE '%Manager%');

--which offices have the same number of employees as the London office?
--show the city, office code, and number of employees
SELECT o.city, o.officeCode, COUNT(e.employeeNumber) AS "Number of Employees"
FROM offices o 
INNER JOIN employees e ON o.officeCode = e.officeCode WHERE o.city != "London"
GROUP BY o.officeCode
HAVING COUNT(e.employeeNumber) = (SELECT COUNT(e.employeeNumber) FROM employees e INNER JOIN offices o ON e.officeCode = o.officeCode WHERE o.city = "London");

--which products have a higher quantity ordered than 1940s Ford Truck?
--show the product names and quantity ordered
SELECT p.productName, SUM(o.quantityOrdered) AS "Quantity Ordered"
FROM orderdetails o 
INNER JOIN products p ON o.productCode = p.productCode
GROUP BY p.productName
HAVING SUM(o.quantityOrdered) > (SELECT SUM(o.quantityOrdered) FROM orderdetails o INNER JOIN products p ON o.productCode = p.productCode WHERE p.productName = "1940s Ford Truck");

--show the products that have a lower dollar value in orders than the 
--1957 Corvette Convertible. show the product name and value
SELECT p.productName, SUM(o.quantityOrdered*o.priceEach) AS "Total Value"
FROM products p
INNER JOIN orderdetails o ON p.productCode = o.productCode
GROUP BY p.productName
HAVING SUM(o.quantityOrdered*o.priceEach) < (SELECT SUM(o.quantityOrdered*o.priceEach) FROM orderdetails o INNER JOIN products p ON o.productCode = p.productCode WHERE p.productName = "1957 Corvette Convertible");

--show the order number, customer number, and order total for orders
--with a larger order total than order number 10222
SELECT o.orderNumber, o.customerNumber, SUM(d.quantityOrdered*d.priceEach) AS "Order Total"
FROM orders o 
INNER JOIN orderdetails d ON o.orderNumber = d.orderNumber
GROUP BY o.orderNumber
HAVING SUM(d.quantityOrdered*d.priceEach) > (SELECT SUM(d.quantityOrdered*d.priceEach) FROM orderdetails d INNER JOIN orders o ON d.orderNumber = o.orderNumber WHERE o.orderNumber = 10222);


--WILDCARD QUERIES

--show the customer name and total payments for companies
--whose name ends in Ltd
SELECT c.customerName, SUM(p.amount) AS "Total Payments"
FROM customers c, payments p 
WHERE c.customerName LIKE '%Ltd'
    AND c.customerNumber = p.customerNumber
GROUP BY c.customerName;

--how many employees have a three digit extension? (xXXX)
SELECT COUNT(employeeNumber) as "Number of Employees"
FROM employees
WHERE extension LIKE 'x___'; 

--show the product code, name, vendor, and buy price for products 
--from the 1950s
SELECT productCode, productName, productVendor, buyPrice
FROM products
WHERE productName LIKE '195%';

--show all office information for offices in the 212 area code
SELECT *
FROM offices
WHERE phone LIKE '%212%';

--show first and last name, employee number, and email for sales managers
SELECT firstName, lastName, employeeNumber, email
FROM employees
WHERE jobTitle LIKE '%Manager%';

--show the name, product code, quantity in stock, and buy price for
--products with Chevy in the name
SELECT productName, productCode, quantityInStock, buyPrice
FROM products
WHERE productName LIKE '%Chevy%';