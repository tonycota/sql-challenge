--select alls for referencing code ingore
select * from departments;
select * from dept_emp;
select * from dept_manager;
select * from employees;
select * from salaries;
select * from titles;


-- list employee number, last name, first name, sex, and their salary
select emp.emp_no, emp.last_name, emp.first_name, emp.sex, sal.salary
from employees as emp
inner join salaries as sal
on sal.emp_no = emp.emp_no

--list the first name, last name, and hire date for eployees who were hired in 1986
select emp_no, first_name, last_name, hire_date
from employees
where hire_date between '1986-01-01' and '1986-12-31';

--list the manager of each department along with their department
--number, department name, employee number, last name, first name

select dm.dept_no, d.dept_name, dm.emp_no, emp.last_name, emp.first_name
from dept_manager as dm 
inner join departments as d
on dm.dept_no = d.dept_no
inner join employees as emp
on dm.emp_no = emp.emp_no

-- list the department number for each employee along with 
-- that employee's employee number, last name, first name, and department name
select d.dept_no, emp.emp_no, emp.last_name, emp.first_name, d.dept_name
from employees as emp
left join dept_emp as demp
on emp.emp_no = demp.emp_no
inner join departments as d
on demp.dept_no = d.dept_no

--list first name, last name, and sex of each employee whose first name is
--Hercules, and whose last name begins with the letter B
select first_name, last_name, sex
from employees
where (first_name like 'Hercules%')  and (last_name like 'B%')

--List each emplooyee in the Sales department, including their employee
--number, last name and first name
select emp.emp_no, emp.last_name, emp.first_name
from employees as emp
inner join dept_emp as dept
on emp.emp_no = dept.emp_no
inner join departments as depart
on depart.dept_no = dept.dept_no
where depart.dept_name = 'Sales';

--list each employee in the sales and development departments,
--including their employee number, last name, first and department name
select emp.emp_no, emp.last_name, emp.first_name, depart.dept_name
from employees as emp
inner join dept_emp as dept
on emp.emp_no = dept.emp_no
inner join departments as depart
on depart.dept_no = dept.dept_no
where depart.dept_name = 'Sales' or depart.dept_name = 'Development'

--list the frequency count, in descending order, of all the employee last names
--(that is, how many employees share each last name).
select last_name, count(last_name)
from employees
group by last_name
order by count(last_name) desc;