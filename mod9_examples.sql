--write a query to calculate the number of customers in each state
--show the state and number of customers
select state,count(state) as "Number of Customers"
from customers
where state is not null
group by state;

--write a query to calculate the number of customers in each state
--show the state and number of customers pnly if the state has more 
--than 3 customers
select state,count(state) as "Number of Customers"
from customers
where state is not null
group by state
having count(state)>3
order by count(state);

--write a query to calculate the number of customers in each state
--show the number of customers only ifthe state has more customers than CT
--display the state and number of customers in the state
select state,count(state) as "Number of Customers"
from customers
where state is not null
group by state
having count(state)>(select count(state) from customers where state = "CT") --nested query
order by count(state) desc;

--display the customer name, number, and phone for customers with
--sales rep "Gerard Hernandez", emp_no = 1370
select customerNumber, customerName, phone, salesRepEmployeeNumber
from customers
where salesRepEmployeeNumber = 1370;

--write the nested query equivalent for the above query
select c.customerNumber, c.customerName, c.phone, e.firstName, e.lastName
from customers c, employees e
where c.customerNumber in (select customerNumber from customers where salesRepEmployeeNumber=1370)
    and c.salesRepEmployeeNumber=e.employeeNumber;