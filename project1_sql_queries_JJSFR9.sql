--list all of the current employees first name, last name, salary and department name
select e.first_name, e.last_name, s.salary, d.dept_name
from salaries s, employees e, departments d, dept_emp de
where s.emp_no = e.emp_no
    and e.emp_no = de.emp_no
    and de.dept_no = d.dept_no
    and s.to_date = "9999-01-01";

--list the first name, last name, and salary of the current employees
--with then 10 lowest salaries
select e.first_name, e.last_name, s.salary
from salaries s, employees e
where s.emp_no = e.emp_no
    and s.to_date = "9999-01-01"
order by s.salary asc
limit 10;

--total payroll for each dapartment in the company
--name the column "total salary" and sort descending
select d.dept_name, sum(s.salary) as "Total Salary"
from salaries s, employees e, dept_emp de, departments d 
where s.emp_no = e.emp_no
    and e.emp_no = de.emp_no
    and de.dept_no = d.dept_no
    and s.to_date = "9999-01-01"
group by d.dept_name
order by sum(s.salary) desc;

--show the titles in the company and the number of current employees with those titles
--name the column "number of employees"
--sort descending
select title, count(emp_no) as "Number of Employees"
from titles
where to_date = "9999-01-01"
group by title
order by count(emp_no) desc;

--list the first name, last name, department name, and salary for all
--current department managers
--sort by "salary" descending
select e.first_name, e.last_name, d.dept_name, s.salary
from titles t, salaries s, employees e, dept_manager dm, departments d
where s.emp_no = e.emp_no
    and e.emp_no = dm.emp_no
    and dm.dept_no = d.dept_no
    and t.emp_no = e.emp_no
    and t.title = "Manager"
    and dm.to_date = "9999-01-01"
    and s.to_date = "9999-01-01"
order by s.salary desc;

--show the three departments with the least number of employees
--name the column "number of employees" and sort ascending
select d.dept_name, count(e.emp_no) as "Number of Employees"
from employees e, dept_emp de, departments d
where e.emp_no = de.emp_no
    and de.dept_no = d.dept_no
    and de.to_date = "9999-01-01"
group by d.dept_name
order by count(e.emp_no) asc
limit 3;

--number of male and female employees currently working
--name the column "number of employees" and sort descending
select e.gender, count(e.emp_no) as "Number of Employees"
from employees e, salaries s
where e.emp_no = s.emp_no
    and s.to_date = "9999-01-01"
group by e.gender
order by count(e.emp_no) desc;

--number of employees hired each year
--name the column "number of employees hired" and sort descending
select year(hire_date), count(emp_no)
from employees
group by year(hire_date)
order by count(emp_no) desc;