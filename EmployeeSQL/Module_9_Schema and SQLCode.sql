--TABLE 1 drop table if it exists
DROP TABLE departments
--Create departments table1
CREATE TABLE departments (
	dept_no VARCHAR(30) NOT NULL,
	dept_name VARCHAR(30) NOT NULL
);
ALTER TABLE departments ADD PRIMARY KEY (dept_no)
--view table
SELECT * FROM departments;

--TABLE 2 drop dept_emp table if it exists
DROP TABLE dept_emp
--create dept_emp table
CREATE TABLE dept_emp (
	emp_no VARCHAR(30) NOT NULL,
	dept_no VARCHAR(30) NOT NULL
);
--view table
SELECT * FROM dept_emp

--TABLE 3 drop dept_manager if it exists
DROP TABLE dept_manager
--Create dept_manager table
CREATE TABLE dept_manager (
	dept_no VARCHAR(30),
	emp_no VARCHAR(30)
);
ALTER TABLE dept_manager ADD PRIMARY KEY (emp_no)
--view table
SELECT * FROM dept_manager

--TABLE 4 drop employees if it exits
DROP TABLE employees
--create employee table
CREATE TABLE employees (
	emp_no VARCHAR(30) NOT NULL,
	emp_title_id VARCHAR(30) NOT NULL,
	birth_date DATE,
	first_name VARCHAR(30), 
	last_name VARCHAR(30),
	sex VARCHAR(10),
	hire_date DATE
);

ALTER TABLE employees ADD PRIMARY KEY (emp_no)
--view table
SELECT * FROM employees

--TABLE 5 drop if it exists
DROP TABLE salaries
--create table salaries
CREATE TABLE salaries (
	emp_no VARCHAR(30) NOT NULL,
	salary INT
);
--view table
SELECT * FROM salaries

--TABLE 6 drop if it exists
DROP TABLE titles
--Create table titles
CREATE TABLE titles(
	title_id VARCHAR(30),
	title VARCHAR(30)
);
--view table
SELECT * FROM titles

--DATA ANALYSIS
--1.List the employee number, last name, first name, sex, and salary of each employee.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
INNER JOIN salaries ON
salaries.emp_no = employees.emp_no

--2. List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT employees.first_name, employees.last_name, employees.hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'

--3. List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT dept_manager.emp_no, dept_manager.dept_no, departments.dept_name, employees.last_name, employees.first_name
FROM dept_manager
INNER JOIN departments ON
dept_manager.dept_no = departments.dept_no
INNER JOIN employees ON
dept_manager.emp_no = employees.emp_no;

--4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
--dept no, employee no, last, first, dept name

SELECT dept_emp.emp_no, employees.first_name, employees.last_name, departments.dept_name
FROM dept_emp
INNER JOIN employees ON
dept_emp.emp_no = employees.emp_no
INNER JOIN departments
dept_emp.dept_no = departments.dept_no;


--5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT employees.first_name, employees.last_name, employees.sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE '%B%';

--6. List each employee in the Sales department, including their employee number, last name, and first name.
SELECT employees.last_name, employees.first_name, dept_emp.emp_no, departments.dept_name
FROM dept_emp
INNER JOIN employees ON
employees.emp_no= dept_emp.emp_no
INNER JOIN departments ON
dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';

--7.List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT employees.last_name, employees.first_name, dept_emp.emp_no, departments.dept_name
FROM

WHERE departments.dept_name = 'Sales'
OR departments.dept_name = 'Develpment';

--8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT COUNT(last_name) AS "tally"
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;
