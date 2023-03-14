--display all customer data
SELECT *
FROM customer;

--display all agent data
SELECT *
FROM agents;

--display customer names and grades
SELECT CUST_NAME, GRADE
FROM customer;

--display agent code, name, and working area
SELECT AGENT_CODE, AGENT_NAME, WORKING_AREA
FROM agents;

--display order number, order amount, and order date
SELECT ORD_NUM, ORD_AMOUNT, ORD_DATE
FROM orders;

--show all customer code, name, country, and phone number, for all customers from the united states
SELECT CUST_CODE, CUST_NAME, CUST_COUNTRY, PHONE_NO
FROM customer
WHERE CUST_COUNTRY = "USA";

--show agent names and phone numbers for agents in bangalore
SELECT AGENT_NAME, PHONE_NO
FROM agents
WHERE WORKING_AREA = "Bangalore";

--show orders with advance amounts of $100
SELECT *
FROM orders
WHERE ADVANCE_AMOUNT = 100;

--show the names of grade 2 customers
SELECT CUST_NAME
FROM customer
WHERE GRADE = 2;

--show all customer information for customers from new york
SELECT *
FROM customer
WHERE WORKING_AREA = "New York";

--show all agent information for agents who work in london with commission rates greater than 0.12
SELECT *
FROM agents
WHERE WORKING_AREA = "London" AND COMMISSION > 0.12;

--show order number, agent code, and customer code for orders with advance amount less than or equal to $500, and order amount greater than or equal to $1500
SELECT ORD_NUM, AGENT_CODE, CUST_CODE
FROM orders
WHERE ADVANCE_AMOUNT <= 500 AND ORD_AMOUNT >= 1500;

--show customer code, customer name, agent code, and outstanding amount for customers with outstanding amounts greater than $6000 and pay amount less than or equal to $3000
SELECT CUST_CODE, CUST_NAME, AGENT_CODE, OUTSTANDING_AMT
FROM customer
WHERE OUTSTANDING_AMT > 6000 AND PAYMENT_AMT <= 3000;

--show order numbers for order amounts less than $1000
SELECT ORD_NUM
FROM orders
WHERE ORD_AMOUNT < 1000;

--show customer names from india with outstanding amounts less than $10000
SELECT CUST_NAME
FROM customer
WHERE CUST_COUNTRY = "India" AND OUTSTANDING_AMT < 10000;