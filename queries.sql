-- Question 1
-- List the following details of each employee: 
---  employee number, last name, first name, gender, and salary

SELECT
	employees.emp_no, 
	employees.first_name, 
	employees.last_name, 
	employees.gender,
	salaries.salary
FROM employees
INNER JOIN salaries
ON salaries.emp_no = employees.emp_no
ORDER BY employees.emp_no;

-- Question 2
-- List employees who were hired in 1986

SELECT
	emp_no,
	first_name,
	last_name
FROM employees
WHERE 
	EXTRACT(YEAR from hire_date) = 1986
ORDER BY emp_no;

-- Question 3
-- List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, 
-- last name, first name, and start and end employment dates.

SELECT
	departments.dept_no,
	departments.dept_name,
	dept_manager.emp_no,
	employees.last_name,
	employees.first_name,
	dept_manager.from_date,
	dept_manager.to_date
FROM employees
JOIN dept_manager
ON employees.emp_no = dept_manager.emp_no
JOIN departments
ON dept_manager.dept_no = departments.dept_no
ORDER BY departments.dept_no;


-- Question 4
-- the department of each employee with the following information: employee number, 
-- last name, first name, and department name.

SELECT
	employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM employees
JOIN dept_emp
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no
ORDER BY emp_no;

-- Question 5
-- List all employees whose first name is "Hercules" and last names begin with "B."

SELECT 
	first_name,
	last_name
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- Question 6
-- List all employees in the Sales department, including their employee number, 
-- last name, first name, and department name.

SELECT
	employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM employees
JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no AND departments.dept_name = 'Sales';

-- Question 7
-- List all employees in the Sales and Development departments, including their 
-- employee number, last name, first name, and department name.
	
SELECT
	employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM
	employees
JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no AND (departments.dept_name = 'Sales' OR 
departments.dept_name = 'Development');

-- Question 8
-- In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name.

SELECT employees.last_name, COUNT(employees.last_name) as num
FROM employees
GROUP BY employees.last_name
ORDER BY num DESC;