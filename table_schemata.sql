CREATE TABLE employees(
	emp_no INT PRIMARY KEY,
	birth_date DATE,
	first_name VARCHAR,
	last_name VARCHAR,
	gender VARCHAR(1),
	hire_date DATE,
	FOREIGN KEY(emp_no) references employees(emp_no)
);

CREATE TABLE departments (
	dept_no VARCHAR PRIMARY KEY,
	dept_name VARCHAR,
);

CREATE TABLE dept_emp (
	emp_no INT,
	dept_no VARCHAR,
	from_date DATE,
	to_date DATE,
	FOREIGN KEY(emp_no) references employees(emp_no),
	FOREIGN KEY(dept_no) references departments(dept_no)
);

CREATE TABLE dept_manager (
	dept_no VARCHAR,
	emp_no INT,
	from_date DATE,
	to_date DATE,
	FOREIGN KEY(emp_no) references employees(emp_no),
	FOREIGN KEY(dept_no) references departments(dept_no)
);

CREATE TABLE salaries(
	emp_no INT,
	salary INT,
	from_date DATE,
	to_date DATE,
	FOREIGN KEY(emp_no) references employees(emp_no)
);

CREATE TABLE titles(
	emp_no INT,
	title VARCHAR,
	from_date DATE,
	to_date DATE,
	FOREIGN KEY(emp_no) references employees(emp_no)
);
