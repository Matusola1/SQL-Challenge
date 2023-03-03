--1.List the employee number, last name, first name, gender, and salary of each employeeSelect * from employees;

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
JOIN salaries on salaries.emp_no=employees.emp_no
LIMIT (10);

--2. List the first name, last name, and hire date for the employeess who were hired in 1986;
select * from employees;

SELECT employees.first_name, employees.last_name, employees.hire_date
FROM employees
WHERE employees.hire_date >= '1986-1-1'::date
AND employees.hire_date < '1987-1-1'::date
;

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name;
SELECT dept_manager.emp_no, dept_manager.dept_no, departments.dept_name, employees.first_name, employees.last_name
FROM dept_manager
JOIN departments ON dept_manager.dept_no = departments.dept_no
JOIN employees ON dept_manager.emp_no = employees.emp_no;

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name;
SELECT dept_emp.dept_no, dept_emp.emp_no, employees.first_name, employees.last_name, departments.dept_name
FROM dept_emp
JOIN departments ON dept_emp.dept_no = departments.dept_no
JOIN employees ON dept_emp.emp_no = employees.emp_no;

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B.";

SELECT * from employees;

SELECT employees.first_name, employees.last_name, employees.sex
FROM employees
WHERE first_name='Hercules' and last_name similar to 'B%'
;

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name;
SELECT employees.emp_no, employees.first_name, employees.last_name, departments.dept_name
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_no = 'd007';

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name;
SELECT employees.emp_no, employees.first_name, employees.last_name, departments.dept_name
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_no = 'd007' OR departments.dept_no = 'd005';

-- 8. List the frequency count of employee last names;
SELECT last_name, COUNT(last_name) AS "Last_name_count"
FROM employees
GROUP BY last_name
ORDER BY "Last_name_count" DESC;
