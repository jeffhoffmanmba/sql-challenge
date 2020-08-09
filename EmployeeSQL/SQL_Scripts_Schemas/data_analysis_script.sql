-- DATA ANALYSIS

-- 1. List details of each employee: employee number, last name, first name, gender and salary
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.gender,
salaries.salary
FROM Employees
Inner JOIN Salaries ON
employees.emp_no = salaries.emp_no;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT employees.emp_no, employees.first_name, employees.last_name, employees.hire_date
FROM Employees
WHERE hire_date >= '1985-12-31'
AND hire_date < '1987-01-01';

-- 3. List the manager of each department with the following information: 
	-- department number, department name, the manager's employee number, last name, first name.
SELECT departments.dept_no, departments.dept_name, employees.emp_no, employees.last_name, employees.first_name
FROM employees
INNER JOIN dept_manager ON
employees.emp_no = dept_manager.emp_no
INNER JOIN departments ON
dept_manager.dept_no = departments.dept_no;

-- 4. List the department of each employee with the following information: 
	-- employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
INNER JOIN dept_employees ON
employees.emp_no = dept_employees.emp_no
LEFT JOIN departments ON
dept_employees.dept_no = departments.dept_no;
	
-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT employees.first_name, employees.last_name, employees.gender
FROM Employees
WHERE employees.first_name = 'Hercules'
AND employees.last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, 
	--first name, and department name
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM Employees
INNER JOIN dept_employees ON
employees.emp_no = dept_employees.emp_no
INNER JOIN departments ON
departments.dept_no = dept_employees.dept_no
WHERE departments.dept_name = 'Sales';
	
-- 7. List all employees in the Sales and Development departments, including their
	-- employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM Employees
INNER JOIN dept_employees ON
employees.emp_no = dept_employees.emp_no
INNER JOIN departments ON
departments.dept_no = dept_employees.dept_no
WHERE departments.dept_name = 'Sales' or departments.dept_name = 'Development';

--8.  In descending order, list the frequency count of employee last names, i.e., how many employees 
	-- share each last name.
SELECT employees.last_name, COUNT(last_name) FROM Employees
GROUP BY last_name
ORDER BY count(last_name) DESC