--2A QUERIES

--display the customer name, number, along with their sales rep's
--number, first and last name

--join
SELECT c.customerName, c.customerNumber, c.salesRepEmployeeNumber, e.firstName, e.lastName
FROM customers c 
JOIN employees e ON c.salesRepEmployeeNumber = e.employeeNumber;

--left join
SELECT c.customerName, c.customerNumber, c.salesRepEmployeeNumber, e.firstName, e.lastName
FROM customers c 
LEFT JOIN employees e ON c.salesRepEmployeeNumber = e.employeeNumber;

--right join
SELECT c.customerName, c.customerNumber, c.salesRepEmployeeNumber, e.firstName, e.lastName
FROM customers c 
RIGHT JOIN employees e ON c.salesRepEmployeeNumber = e.employeeNumber;

--display each employee's first and last name and their office code, city, and phone

--join
SELECT e.firstName, e.lastName, o.officeCode, o.city, o.phone
FROM employees e 
JOIN offices o ON e.officeCode = o.officeCode;

--left join
SELECT e.firstName, e.lastName, o.officeCode, o.city, o.phone
FROM employees e 
LEFT JOIN offices o ON e.officeCode = o.officeCode;

--right join
SELECT e.firstName, e.lastName, o.officeCode, o.city, o.phone
FROM employees e 
RIGHT JOIN offices o ON e.officeCode = o.officeCode;

--display the customer's name and number along with the order number,
--order date, product name, quantity, and price for each customer's orders

--join
SELECT c.customerName, c.customerNumber, o.orderNumber, o.orderDate, d.quantityOrdered, d.quantityOrdered*d.priceEach AS "Cost"
FROM customers c 
JOIN orders o ON c.customerNumber = o.customerNumber
JOIN orderdetails d ON o.orderNumber = d.orderNumber;

--left join
SELECT c.customerName, c.customerNumber, o.orderNumber, o.orderDate, d.quantityOrdered, d.quantityOrdered*d.priceEach AS "Cost"
FROM customers c 
LEFT JOIN orders o ON c.customerNumber = o.customerNumber
LEFT JOIN orderdetails d ON o.orderNumber = d.orderNumber;

--right join
SELECT c.customerName, c.customerNumber, o.orderNumber, o.orderDate, d.quantityOrdered, d.quantityOrdered*d.priceEach AS "Cost"
FROM customers c 
RIGHT JOIN orders o ON c.customerNumber = o.customerNumber
RIGHT JOIN orderdetails d ON o.orderNumber = d.orderNumber;

--display the customer name and number along with the payment date,
--check number, and amount for each payment

--join
SELECT c.customerName, c.customerNumber, p.paymentDate, p.checkNumber, p.amount
FROM customers c 
JOIN payments p ON c.customerNumber = p.customerNumber;

--left join
SELECT c.customerName, c.customerNumber, p.paymentDate, p.checkNumber, p.amount
FROM customers c 
LEFT JOIN payments p ON c.customerNumber = p.customerNumber;

--right join
SELECT c.customerName, c.customerNumber, p.paymentDate, p.checkNumber, p.amount
FROM customers c 
RIGHT JOIN payments p ON c.customerNumber = p.customerNumber;

--display the product line, description, and product name for all products

--join
SELECT pl.productLine, p.productDescription, p.productName
FROM productlines pl 
JOIN products p ON pl.productLine = p.productLine;

--left join
SELECT pl.productLine, p.productDescription, p.productName
FROM productlines pl 
LEFT JOIN products p ON pl.productLine = p.productLine;

--right join
SELECT pl.productLine, p.productDescription, p.productName
FROM productlines pl 
RIGHT JOIN products p ON pl.productLine = p.productLine;


--2B QUERIES

--show the customer name, order number and date only for customers who have placed orders
SELECT c.customerName, o.orderNumber, o.orderDate
FROM customers c 
JOIN orders o ON c.customerNumber = o.customerNumber
WHERE o.orderNumber IS NOT NULL;

--show the order number and order total for all orders
--include orders with no order details
SELECT o.orderNumber, d.quantityOrdered*d.priceEach AS "Order Total"
FROM orders o
RIGHT JOIN orderdetails d ON o.orderNumber = d.orderNumber;

--show the employee first and last name and office address line 1, state, and country
--for all employees
SELECT e.firstName, e.lastName, o.addressLine1, o.state, o.country
FROM employees e
JOIN offices o ON e.officeCode = o.officeCode;

--show the customer number, payment date, check number, and amount for each payment
--include customers who have not made payments
SELECT c.customerNumber, p.paymentDate, p.checkNumber, p.amount
FROM customers c 
LEFT JOIN payments p ON c.customerNumber = p.customerNumber;

--show the employee name, customer name, and the total sales for that customer
--include employees even if they do not have customers
SELECT e.firstName, e.lastName, c.customerName, d.priceEach*d.quantityOrdered AS "Total Sales"
FROM customers c
RIGHT JOIN employees e ON e.employeeNumber = c.salesRepEmployeeNumber
JOIN orders ON c.customerNumber = o.customerNumber
JOIN orderdetails o ON o.orderNumber = d.orderNumber;

--could not figure out this last one, here is my best attempt