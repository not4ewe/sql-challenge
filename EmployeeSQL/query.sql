--List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT Employee.emp_no, Employee.last_name, Employee.first_name, Employee.sex, Salaries.salary
FROM Employee
INNER JOIN Salaries
ON Employee.emp_no = Salaries.emp_no;

--List first name, last name, and hire date for employees who were hired in 1986.

SELECT first_name,last_name,hire_date
FROM Employee
where extract(YEAR from hire_date) = 1986;
  
--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

SELECT Dept_Emp.dept_no,  Dept_Emp.emp_no, Employee.last_name, Employee.first_name, Departments.dept_name
FROM Dept_Emp 
INNER JOIN Employee ON Dept_Emp.emp_no = Employee.emp_no
INNER JOIN Departments ON Dept_Emp.dept_no = Departments.dept_no;

--List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT Dept_Manager.emp_no,Employee.last_name, Employee.first_name, Departments.dept_name
FROM Dept_Manager 
INNER JOIN Employee ON Dept_Manager.emp_no = Employee.emp_no
INNER JOIN Departments ON Dept_Manager.dept_no = Departments.dept_no;

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT first_name,last_name,sex
FROM Employee
where first_name = 'Hercules'
AND last_name LIKE 'B%';

--List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT Dept_Manager.emp_no,Employee.last_name, Employee.first_name, Departments.dept_name
FROM Dept_Manager 
INNER JOIN Employee ON Dept_Manager.emp_no = Employee.emp_no
INNER JOIN Departments ON Dept_Manager.dept_no = Departments.dept_no
WHERE dept_name = 'Sales';

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT Employee.emp_no,Employee.last_name, Employee.first_name, Departments.dept_name
FROM Employee 
INNER JOIN Dept_Emp ON Employee.emp_no = Dept_Emp.emp_no
INNER JOIN Departments ON Dept_Emp.dept_no = Departments.dept_no
WHERE dept_name = 'Sales'
OR dept_name = 'Development';

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT last_name, COUNT (*) 
FROM Employee
GROUP BY last_name
ORDER By count DESC;

--Epilogue

SELECT Employee.emp_no,Employee.last_name, Employee.first_name
FROM Employee
WHERE Employee.emp_no = 499942;


ALTER TABLE "Departments"
  RENAME TO Departments;
ALTER TABLE "Dept_Emp"
  RENAME TO Dept_Emp;
ALTER TABLE "Dept_Manager"
  RENAME TO Dept_Manager;
ALTER TABLE "Employee"
  RENAME TO Employee;
ALTER TABLE "Salaries"
  RENAME TO Salaries;
ALTER TABLE "Titles"
  RENAME TO Titles;  
  
  
select Employee.emp_no, Salaries.salary, Employee.emp_title_id,Titles.title_id, Titles.title
from Employee 
inner join Salaries on Employee.emp_no = Salaries.emp_no
inner join Titles on Employee.emp_title_id = Titles.title_id;
