--calculate the average payment made by each customer
--show the customer number and average amount
SELECT customerNumber, AVG(amount) AS "Average Payment" --names the column
FROM payments
GROUP BY customerNumber;

--same as above, but return name and number and round avg to 2 decimal
SELECT c.customerNumber, c.customerName, ROUND(AVG(p.amount),2) AS "Average Payments"
FROM payments p, customers c
WHERE p.customerNumber = c.customerNumber
GROUP BY p.customerNumber;

--number of payments made by each customer who made payments
SELECT customerNumber, COUNT(amount) AS "Number of Payments"
FROM payments
GROUP BY customerNumber;

--calculate the total payments made by customers who have made payments
SELECT customerNumber, SUM(amount) AS "Total Payment Amount"
FROM payments
GROUP BY customerNumber;

--calculate the number of customers an employee has
--display the employee first name, last name, and number of customers
--display results in descending order
SELECT e.firstName, e.lastName, COUNT(c.salesRepEmployeeNumber) AS "Number of Customers"
FROM employees e, customers c
WHERE c.salesRepEmployeeNumber = e.employeeNumber
GROUP BY c.salesRepEmployeeNumber --what you are trying to count
ORDER BY COUNT(c.salesRepEmployeeNumber) DESC; -- ORDER BY orders by ascending by default

--calculate the total charge for each order
--display the 10 most expensive orders in descending order
--display order number and total charge
SELECT orderNumber, SUM(quantityOrdered * priceEach) AS "Total Charge"
FROM orderdetails
GROUP BY orderNumber
ORDER BY SUM(quantityOrdered * priceEach) DESC
LIMIT 10;