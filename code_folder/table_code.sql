drop table if exists dept_emp;
drop table if exists dept_manager;
drop table if exists departments;
drop table if exists employees;
drop table if exists salaries;
drop table if exists titles;

create table titles(
	title_id VARCHAR(5) primary key not null,
	title VARCHAR(20) not null
);

create table salaries(
	emp_no int primary key not null,
	salary int not null
);

create table employees(
	emp_no int primary key not null,
	emp_title_id VARCHAR(5) not null, 
	birth_date date not null,
	first_name VARCHAR(20) not null,
	last_name VARCHAR(20) not null,
	sex VARCHAR(1) not null,
	hire_date date not null,
	foreign key (emp_title_id) references titles(title_id)
);

create table departments(
	dept_no VARCHAR(4) primary key not null,
	dept_name VARCHAR(20) not null
);

create table dept_manager(
	dept_no VARCHAR(4) not null,
	emp_no int not null,
    PRIMARY KEY(emp_no, dept_no), -- COMPOSITE KEY!!
	foreign key (emp_no) references employees(emp_no)
);

create table dept_emp(
	emp_no int not null,
	dept_no VARCHAR(4) not null,
    PRIMARY KEY(emp_no, dept_no), -- COMPOSITE KEY!!
	foreign key (dept_no) references departments(dept_no),
    Foreign Key (emp_no) REFERENCES employees(emp_no)
);


-- learned how to copy csv files via vscode

copy titles(title_id, title)
from '/tmp/titles.csv' delimiter ',' csv header;

copy salaries(emp_no, salary)
from '/tmp/salaries.csv' delimiter ',' csv header;

copy employees(
    emp_no
    , emp_title_id
    , birth_date
    , first_name
    , last_name
    , sex
    , hire_date
)
from '/tmp/employees.csv' delimiter ',' csv header;

copy departments(dept_no, dept_name)
from '/tmp/departments.csv' delimiter ',' csv header;

copy dept_manager(
    dept_no
    , emp_no
)
from '/tmp/dept_manager.csv' delimiter ',' csv header;

copy dept_emp(
    emp_no
    , dept_no
)
from '/tmp/dept_emp.csv' delimiter ',' csv header;
