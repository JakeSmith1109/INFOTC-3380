--display all data from the orders table
SELECT *
FROM orders;

--select order number, customer number, agent code, and amount from orders
SELECT ORD_NUM, CUST_CODE, AGENT_CODE, ORD_AMOUNT
FROM orders;

--select order number, customer number, agent code, and amount from orders
--for agent A002
SELECT ORD_NUM, CUST_CODE, AGENT_CODE, ORD_AMOUNT
FROM orders
WHERE AGENT_CODE = "A002";

--select order number, customer number, agent code, and amount from orders
--for agent A002, and the order amount is >2000
SELECT ORD_NUM, CUST_CODE, AGENT_CODE, ORD_AMOUNT
FROM orders
WHERE AGENT_CODE = "A002" AND ORD_AMOUNT > 2000;

--select order number, customer number, agent code, and amount from orders
--for agent A002, and the order amount is >2000
--sort in ascending order
SELECT ORD_NUM, CUST_CODE, AGENT_CODE, ORD_AMOUNT
FROM orders
WHERE AGENT_CODE = "A002" AND ORD_AMOUNT > 2000
ORDER BY ORD_AMOUNT; --use DESC for descending, ascending is default, or can use ASC

