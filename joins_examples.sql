--display the customer name and number along with
--employee number and first/last name
--include only employees who have customers
SELECT c.customerName, c.customerNumber, e.employeeNumber, e.firstName, e.lastName
FROM customers c, employees e 
WHERE c.employeeNumber = e.employeeNumber; --how we usually do it

--with join instead
SELECT c.customerName, c.customerNumber, e.employeeNumber, e.firstName, e.lastName
FROM customers c --left table
JOIN employees e ON c.salesRepEmployeeNumber = e.employeeNumber;
--middle values in venn diagram

--include employees who do not have customers
SELECT c.customerName, c.customerNumber, e.employeeNumber, e.firstName, e.lastName, e.jobTitle
FROM customers c
RIGHT JOIN employees e ON c.salesRepEmployeeNumber = e.employeeNumber;
--joins right side of venn diagram with middle

--include customers who do not have employees
SELECT c.customerName, c.customerNumber, e.employeeNumber, e.firstName, e.lastName, e.jobTitle
FROM customers c
LEFT JOIN employees e ON c.salesRepEmployeeNumber = e.employeeNumber;
--joins left side of venn diagram with middle

-- SELECT []
-- FROM [left table]
-- [direction] JOIN [right table] ON [leftTable.[] = rightTable.[]]

--display the order number, customer name, employee first/last name
--for customers who have placed orders
SELECT o.orderNumber, c.customerName, e.firstName, e.lastName
FROM customers c
JOIN orders o ON c.customerNumber = o.customerNumber
JOIN employees e ON e.employeeNumber = c.salesRepEmployeeNumber;

--include customers who have not placed orders
SELECT o.orderNumber, c.customerName, e.firstName, e.lastName
FROM customers c
LEFT JOIN orders o ON c.customerNumber = o.customerNumber
JOIN employees e ON e.employeeNumber = c.salesRepEmployeeNumber;

--only customers who did not place orders
SELECT o.orderNumber, c.customerName, e.firstName, e.lastName
FROM customers c
LEFT JOIN orders o ON c.customerNumber = o.customerNumber
JOIN employees e ON e.employeeNumber = c.salesRepEmployeeNumber
WHERE o.orderNumber IS NULL;

--show customer names and amounts for customers who have not made payments
SELECT c.customerName, p.amount
FROM customers c 
LEFT JOIN payments p ON c.customerNumber = p.customerNumber
WHERE p.customerNumber IS NULL;

--same thing with subquery
SELECT customerName
FROM customers
WHERE customerNumber NOT IN (SELECT customerNumber FROM payments);