use sample1;

create table worker (
worker_id int primary key,
first_name varchar(255),
last_name varchar(255),
salary decimal(10,2),
joining_date date,
department varchar(255));


INSERT INTO worker VALUES
(1, 'Monika', 'Arora', 100000, '2014-02-20', 'HR'),
(2, 'Niharika', 'Verma', 80000, '2014-06-11', 'Admin'),
(3, 'Vishal', 'Singhal', 300000, '2014-02-20', 'HR'),
(4, 'Amitabh', 'Singh', 500000, '2014-02-20', 'Admin'),
(5, 'Vivek', 'Bhati', 500000, '2014-06-11', 'Admin'),
(6, 'Vipul', 'Diwan', 200000, '2014-06-11', 'Account'),
(7, 'Satish', 'Kumar', 75000, '2014-01-20', 'Account'),
(8, 'Geetika', 'Chauhan', 90000, '2014-04-11', 'Admin');


-- question 1 

select first_name from worker order by Department desc;

-- question 2 

select * from worker where first_name in('vipul','satish');

-- question 3

select * from worker where length (first_name) = 6 and right (first_name,1) ='h' ;

-- question 4 
-- question is not completed i guess

-- question 5 

select first_name, last_name, COUNT(*) as 'Duplicate' from worker group by first_name, last_name having count(*) > 1;


-- question 6 

select * from worker limit 6;

-- question 7 

select department from worker group by department having count(*)<5;

-- question 8 
select department, count(*) as 'Employees' from worker group by department;

-- question 9 
--doubt