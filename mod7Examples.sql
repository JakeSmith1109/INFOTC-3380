--calculate the current average salary for each department for current employees
--show the department, name, and avg salary as "Average Salary"
select d.dept_name, avg(s.salary) as "Average Salary"
from departments d, dept_emp de, employees e, salaries s
where d.dept_no = de.dept_no
    and de.emp_no = e.emp_no
    and e.emp_no = s.emp_no
    and de.to_date = "9999-01-01"
    and s.to_date = "9999-01-01"
group by d.dept_name;