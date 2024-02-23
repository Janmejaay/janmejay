
-- page 29 questions 1-12
-- question 1  Display all information in the tables EMP and DEPT. 

select * from employees as e
join departments as d
on  e.department_id = d.department_id;

-- question 2 Display only the hire date and employee name for each employee.

select first_name, last_name, hire_date from employees;

-- question 3 Display the name concatenated with the job ID, separated by a comma and space, and name the column Employee and Title 

select concat(first_name,' ',last_name,', ' ,job_id) as Employee_and_Title from employees;

-- question 4 Display the hire date, name and department number for all clerks

select first_name, hire_date,department_id from employees
where job_id = "pu_clerk";

-- question 5 . Create a query to display all the data from the EMP table. Separate each column by a comma. Name the column THE OUTPUT

select concat(employee_id, ', ', first_name,', ',last_name,', ',email,', ',phone_number,', ', hire_date,', ',job_id,', ',salary,', ',COALESCE(commission_pct, 'NULL'),', ',COALESCE(manager_id, 'NULL'),', ',department_id,', ') as output from employees;

-- question 6 Display the names and salaries of all employees with a salary greater than 2000. 

select first_name, Last_name , salary from employees where salary > 2000;

-- question 7 Display the names and dates of employees with the column headers "Name" and "Start Date"

select concat(first_name,' ', last_name) as Name , hire_date as Start_date from employees;

-- question 8 . Display the names and hire dates of all employees in the order they were hired.
select first_name, last_name, hire_date from employees order by hire_date;

-- question 9 Display the names and salaries of all employees in reverse salary order.

select first_name, last_name, salary from employees order by salary desc ;

-- question 10 Display 'ename" and "deptno" who are all earned commission and display salary in reverse order. 

select first_name, department_id, commission_pct, salary from employees 
where commission_pct is not null 
order by salary desc;

-- question 11 Display the last name and job title of all employees who do not have a manager

select e.last_name,j.job_title from employees as e
join jobs as j
on e.job_id = j.job_id
where manager_id is null; 

-- question 12 Display the last name, job, and salary for all employees whose job is sales representative or stock clerk and whose salary is not equal to $2,500, $3,500, or $5,000

select e.last_name,j.job_title, e.salary from employees as e 
join jobs as j
on e.job_id = j.job_id
where e.job_id = 'pu_clerk' or e.job_id = 'sa_rep' and salary not in (2500, 3500, 5500);


-- page 30 questions 1-14

-- question 1 Display the maximum, minimum and average salary and commission earned. 
select max(salary),min(salary),avg(salary),max(coalesce(commission_pct)),min(coalesce(commission_pct)),avg(coalesce(commission_pct)) from employees;

-- question 2 Display the department number, total salary payout and total commission payout for each department.

select jobs.job_title,sum(salary),sum(coalesce(commission_pct,0)) from employees 
join jobs 
on employees.job_id=jobs.job_id
group by jobs.job_title;

-- question 3 Display the department number and number of employees in each department. 

select department_id, count(employee_id) from employees group by department_id;

-- question 4  Display the department number and total salary of employees in each department. 

select department_id ,sum(salary) from employees group by department_id ;

-- question 5 Display the employee's name who doesn't earn a commission. Order the result set without using the column name 

select first_name , last_name from employees where commission_pct is null;

-- question 6 Display the employees name, department id and commission. If an Employee doesn't earn the commission, then display as 'No commission'. Name the columns appropriately

select concat(first_name, ' ', last_name) as Name , department_id as 'Department ID', coalesce(commission_pct, 'No Commission') as Commission from employees;

-- question 7  Display the employee's name, salary and commission multiplied by 2. If an Employee doesn't earn the commission, then display as 'No commission. Name the columns appropriately
 
 select concat(first_name, ' ', last_name) as Name, salary as 'Salary' , case when commission_pct is not null then commission_pct*2 else 'No Commission' end as 'Commission X 2' from employees;
 
 -- question 8 Display the employee's name, department id who have the first name same as another employee in the same department

select  first_name , department_id from employees
where (first_name, department_id) in (select first_name, department_id from employees group by first_name, department_id having COUNT(*) > 1);

-- question 9 Display the sum of salaries of the employees working under each Manager

select sum(salary) from employees where manager_id is not null;


-- question 10 Select the Managers name, the count of employees working under and the department ID of the manager.
--  manager table data  is not given but i have tried to solve the query please check 

select m.manager_name, count(e.employee_id) from employees as e
join managers as m
on e.manager_id=m.manager_id
group by m.manager_name;


-- question 11 Select the employee name, department id, and the salary. Group the result with the manager name and the employee last name should have second letter 'a! 
-- manager data not given 


-- question 12 Display the average of sum of the salaries and group the result with the department id. Order the result with the department id. 

select department_id, sum(salary) from employees group by department_id order by department_id;

-- question 13  Select the maximum salary of each department along with the department id

select department_id , max(salary) from employees group by department_id;


-- question 14 Display the commission, if not null display 10% of salary, if null display a default value 1

select concat(first_name, ' ', last_name) as Name, case when commission_pct is not null then salary*0.10 else 1 end as Commission from employees; 


-- page 31 questions 1-14

-- question 1  Write a query that displays the employee's last names only from the string's 2-5th
-- position with the first letter capitalized and all other letters lowercase, Give each column an
-- appropriate label.



-- question 2 Write a query that displays the employee's first name and last name along with a " in
-- between for e.g.: first name : Ram; last name : Kumar then Ram-Kumar. Also displays the
-- month on which the employee has joined.

select concat(first_name, ':' , last_name, '    ',first_name, '-', last_name) as Name , hire_date from employees;

-- question 3 Write a query to display the employee's last name and if half of the salary is greater than
-- ten thousand then increase the salary by 10% else by 11.5% along with the bonus amount of
-- 1500 each. Provide each column an appropriate label.

select last_name, salary, case when salary*0.5 > 10000 then salary*1.10 + 1500 else salary*1.15 + 1500 end as 'adjusted salary' from employees;


-- question 4 Display the employee ID by Appending two zeros after 2nd digit and 'E' in the end, department id,
-- salary and the manager name all in Upper case, if the Manager name
-- consists of 'z' replace it with '$! 

select concat(substring(employee_id from 1 for 2), '00E') as 'Formatted Employee Id' from employees;


-- question 5 Write a query that displays the employee's last names with the first letter capitalized and
-- all other letters lowercase, and the length of the names, for all employees whose name
-- starts with J, A, or M. Give each column an appropriate label. Sort the results by the
-- employees' last names 

select concat(upper(substring(last_name from 1 for 1 )), lower(substring(last_name from 2 ))) as 'Formatted Last Name', length(last_name) as 'Length of Name' from employees
where last_name like 'J%' or last_name like 'A%' or last_name like 'M%' order by last_name;

-- question 6 Create a query to display the last name and salary for all employees. Format the salary to
-- be 15 characters long, left-padded with $. Label the column SALARY

select last_name, concat('$',salary) as salary from employees;

-- question 7 Display the employee's name if it is a palindrome 

select first_name as Name from employees where lower(first_name) = reverse(lower(first_name));

-- question 8 Display First names of all employees with initcaps

select concat(upper(substring(first_name, 1, 1)), lower(substring(first_name from 2))) as 'Name' from employees;

-- question 9 From LOCATIONS table, extract the word between first and second space from the STREET ADDRESS column.
select street_address doubt;


-- question 10 Extract first letter from First Name column and append it with the Last Name. Also add
-- "@systechusa.com" at the end. Name the column as e-mail address. All characters should
-- be in lower case. Display this along with their First Name.

select first_name , concat(upper(substring(first_name from 1 for 1)),lower(substring(last_name from 1)), "@systechusa.com") as 'E-mail Address' from employees;


-- question 11  Display the names and job titles of all employees with the same job as Trenna

select e.first_name as 'First Name' ,j.job_title as 'Job Title' from employees as e join jobs as j on e.job_id = j.job_id where e.job_id = (select job_id from employees where first_name = 'Trenna') ;

-- question 12 . Display the names and department name of all employees working in the same city as Trenna.

select e.first_name, d.department_name from employees as e join departments as d on e.department_id=d.department_id 
join locations as l on d.location_id=l.location_id where l.city = (select l.city from employees as e join departments as d on e.department_id=d.department_id 
join locations as l on d.location_id=l.location_id  where first_name ='Trenna');

-- question 13 Display the name of the employee whose salary is the lowest

select first_name as 'Name', min(salary) as 'Salary' from employees group by first_name order by salary limit 1;

-- question 14 Display the names of all employees except the lowest paid.

select First_name from employees where salary > (select min(salary) from employees);

-- page 32 questions questions 1-10

-- question 1 Write a query to display the last name, department number, department name for all employees.

select e.last_name as 'Last Name' , e.department_id as 'Department ID',d.department_name as 'Department Name' from employees as e 
join departments as d 
on e.department_id=d.department_id;

-- question 2 Create a unique list of all jobs that are in department 4. Include the location of the department in the output.


select distinct j.job_title as 'Job Name', l.city as 'City' from employees as e join jobs as j on e.job_id=j.job_id  join departments as d join locations as l on d.location_id=l.location_id where e.department_id= 40;

-- question 3 Write a query to display the employee last name,department name,location id and city of all employees who earn commission. 

select e.last_name as 'Last Name' ,d.department_name as 'Department Name', d.location_id as 'Location ID',l.city as 'City' from employees as e 
join departments as d 
on e.department_id=d.department_id
join locations as l 
on d.location_id=l.location_id
where e.commission_pct <> 0;

-- question 4 Display the employee last name and department name of all employees who have an 'a' in their last name 

select e.last_name as 'Last Name',d.department_name as 'Department Name' from employees as e 
join departments as d 
on e.department_id=d.department_id
having last_name like 'A%';


-- question 5 Write a query to display the last name,job,department number and department name forb all employees who work in ATLANTA. 

select e.last_name as 'Last Name',j.job_title as 'Job',d.department_id as 'Department ID', d.department_name as 'Department Name' from employees as e 
join departments as d 
on e.department_id=d.department_id
join jobs as j 
on e.job_id=j.job_id
join locations as l
on d.location_id=l.location_id
where l.city = 'ATLANTA';

-- question 6 Display the employee last name and employee number along with their manager's last name and manager number. 
-- Manager data is not given so could not add last name 

select last_name as 'Last Name', employee_id as 'Employee ID', manager_id as 'Manager ID' from employees where manager_id is not null;

-- question 7 Display the employee last name and employee number along with their manager's last name and manager number (including the employees who have no manager). 
-- Manager data is not given so could not add last name 

select last_name as 'Last Name', employee_id as 'Employee ID', manager_id as 'Manager ID' from employees;

-- question 8 Create a query that displays employees last name,department number,and all the employees who work in the same department as a given employee. 
-- Particular Employee Name Not Given Using Lex for the example 

select e.last_name as 'Last Name',d.department_id as 'Department ID' from employees as e 
join departments as d 
on e.department_id=d.department_id
where e.department_id = ( select department_id from employees where first_name= 'Lex');


-- question 9 Create a query that displays the name,job,department name,salary,grade for all employees. Derive grade based on salary(>=50000=A, >=30000=B,<30000=C) 

select first_name as 'Name' ,j.job_title as 'Job', d.department_name as 'Department Name', e.salary,
case when salary>=50000 then 'A' when salary>= 30000 then 'B' else 'C' end as 'Grade'from employees as e 
join departments as d 
on e.department_id=d.department_id
join jobs as j 
on e.job_id=j.job_id;

-- question 10 Display the names and hire date for all employees who were hired before their managers along withe their manager names and hire date. Label the columns as Employee
-- name, emp_hire_date,manager name,man_hire_date

-- MANAGER DATA IS NOT GIVEN 

-- page 34 Questions 1-12

-- question 1 Write a query to display the last name and hire date of any employee in the same department as SALES.

select last_name as 'Last Name', hire_date as 'Hire Date' from employees where job_id= 'SA_REP';

-- question 2 Create a query to display the employee numbers and last names of all employees who earn more than the average salary. Sort the results in ascending order of salary. 

select employee_id as 'Employee ID', last_name as 'Last Name' from employees where salary > ( select avg(salary) from employees);

-- question 3 Write a query that displays the employee numbers and last names of all employees who work in a department with any employee whose last name contains a' u 

select employee_id as 'Employee ID', last_name as 'Last Name' from employees where department_id in (select department_id from employees where last_name like '%u%');

-- question 4  Display the last name, department number, and job ID of all employees whose department location is ATLANTA. 

select e.last_name as 'Last Name', e.department_id as 'Department ID', e.job_id as 'Job ID' from employees as e 
join locations as l 
where l.city ='Atlanta';

-- question 5  Display the last name and salary of every employee who reports to FILLMORE.
--  Manager data is not given 

-- question 6 Display the department number, last name, and job ID for every employee in the OPERATIONS department.

select e.department_id as 'Department ID' , e.last_name as 'Last Name', j.job_id as 'Job ID' from employees as e
join departments as d 
on e.department_id=d.department_id
join jobs as j
on e.job_id=j.job_id
where d.department_name = 'operations';


-- question 7 Modify the above query to display the employee numbers, last names, and salaries of all 
-- employees who earn more than the average salary and who work in a department with 
-- any employee with a 'u'in their name. 

select employee_id as 'Employee ID', last_name as 'Last Name', salary as 'Salary' from employees 
where salary > (select avg(salary) from employees where department_id in (select department_id from employees where last_name like '%u%'));


-- question 8 Display the names of all employees whose job title is the same as anyone in the sales dept.

select e.last_name , e.first_name from employees as e 
join jobs as j
on e.job_id=j.job_id
join departments as d
on e.department_id=d.department_id
where d.department_name = 'Sales';


-- question 9 Write a compound query to produce a list of employees showing raise percentages,
-- employee IDs, and salaries. Employees in department 1 and 3 are given a 5% raise,
-- employees in department 2 are given a 10% raise, employees in departments 4 and 5 are
-- given a 15% raise, and employees in department 6 are not given a raise.

select employee_id as 'Employee ID', case 
when department_id in (10) then salary*1.05
when department_id in (30) then salary*1.05
when department_id in (20) then salary*1.10
when department_id in (40) then salary*1.15
when department_id in (50) then salary*1.15
else salary*1
end as Salary,
case 
when department_id in (10) then '5%'
when department_id in (30) then '5%'
when department_id in (20) then '10%'
when department_id in (40) then '15%'
when department_id in (50) then '15%'
else 'No Raise'
end
as 'Raise Percentage'
from employees;

-- question 10 Write a query to display the top three earners in the EMPLOYEES table. Display their last names and salaries. 

select last_name as 'Last Name', salary as salary from employees order by salary desc limit 3;


-- question 11 Display the names of all employees with their salary and commission earned. Employees with a null commission should have O in the commission column 

select first_name as 'First Name',last_name as 'Last Name', salary as 'Salary', coalesce(commission_pct, 0) as 'Commission Earned'  from employees ;

-- question 12 Display the Managers (name) with top three salaries along with their salaries and department information.

-- Manager Data is not given 

