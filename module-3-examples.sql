--display agent name, customer name, order number, and order amount
SELECT a.AGENT_NAME, c.CUST_NAME, o.ORD_NUM, o.ORD_AMOUNT
FROM agents a, customer c, orders o
WHERE a.AGENT_CODE = o.AGENT_CODE AND o.CUST_CODE = c.CUST_CODE; --stating reltionship that already exists bewteen the tables

--same as above without the aliases
SELECT agents.AGENT_NAME, customer.CUST_NAME, orders.ORD_NUM, orders.ORD_AMOUNT
FROM agents, customer, orders
WHERE agents.AGENT_CODE = orders.AGENT_CODE AND orders.CUST_CODE = customer.CUST_CODE;

--display agent name, customer name, customer code, order number, and order amount
--placed by customer C0020
SELECT a.AGENT_NAME, c.CUST_NAME, c.CUST_CODE, o.ORD_NUM, o.ORD_AMOUNT
FROM agents a, customer c, orders o
WHERE a.AGENT_CODE = o.AGENT_CODE AND o.CUST_CODE = c.CUST_CODE AND c.CUST_CODE = "C00020";
--can also use c.CUST_NAME = "Albert" instead of last statement in WHERE query, but there could be 2 Albert's

--display customer name and all of the agent information
SELECT c.CUST_NAME, a.*
FROM customer c, agents a
WHERE a.AGENT_CODE = c.AGENT_CODE;

--display customer name and all of the agent information for agent A008
SELECT c.CUST_NAME, a.*
FROM customer c, agents a
WHERE a.AGENT_CODE = c.AGENT_CODE AND a.AGENT_CODE = "A008";