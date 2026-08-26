show databases;

create database student;

use student;

Create table s1(roll_no int,
name varchar(25),
class varchar(5),address varchar(30));

 select * from s1;
 
 insert into s1 values(1,"Sahil","BCA","A/P.Mahagaon"),(2,"Deepak","BCA","A?P.Mahagaon"),
 (3,"Prasanna","Bcom","A/P.Gadhinglaj"),(4,"Rohit","BSC","A/P.Kolhapur");
 
 select * from s1;
 
 
 # employee data 
 
 create database employee;
 
 use employee;
 
 create table e1(Emp_ID varchar(5),Name varchar(20),
 Age int,Gender varchar(10),Department varchar(20),Salary int,city varchar(20));
 
 select * from e1;
 
 insert into e1 values(101,"Sahil",22,"Male","IT",60000,"Kolhapur"),
(102,"Deepak",21,"Male","HR",72000,"Pune"),
(103,"Vivek",23,"Male","Finance",85000,"Gadhinglaj"),
(104,"Prasanna",25,"Male","Marketing",39000,"Pune"),
(105,"Sanika",19,"Female","HR",40000,"Kolhapur");

select * from e1;

-- Q.1 create a table named Student with columns --
create database School;
use School;
create table S1(Student_id int primary key,Name varchar(30) not null,
Age int,City varchar(30));

 select * from S1;
 -- Q.2 insert 5 records into student table --
 insert into S1 values(101,"Sahil Redekar",22,"Mahagaon"),
 (102,"Prasanna Divate",25,"Gadhinglaj"),
 (103,"Deepak Surange",21,"Mahagaon"),
 (104,"Vivek Dabade",23,"Kolhapur"),
 (105,"Aditya Redekar",24,"Mumbai");
 
 select * from S1;
 
 -- Q.3 create an employee table --
 create table s2(emp_id int unique,name varchar(20)not null,
 salary int (10) check (salary > 100000));
 
 select * from s2;
 
 insert into s2 values(111,"Rohit",890000),
(112,"Akash",900000),(113,"Sanika",500000);

 select * from s2;
 
 -- Q.4 create a product table --
 create table s3(product_id varchar(10)primary key,stock int default 0);
 select * from s3;
 
 insert into s3 values (1,50000);
 select * from s3;
 insert into s3 (product_id) values (2);
 select * from s3;
 
 -- Q5 create a department table and an employee table.add foreign key in the employee table that references the  department table --
 use School;
 create table d1(id int primary key,dept_name varchar(10));
 insert into d1 values(101,"Finance"),(102,"HR");
 select * from depart;
 
 create table e111(emp_id int primary key,emp_name varchar(10),u_id int,
 foreign key(u_id) references d1(id));
 insert into e111 values(1,"amey",101),(2,"sahil",102);
 select * from e111;
 
 -- Q6 Insert 3 records into the Department table and
 -- 3 records into the Employee table so that the foreign key works correctly.
 use School;
create table d2 (id int primary key,name varchar(10),dept_name varchar(20));
insert into d2 values(101,"sahil","HR"),
(102,"Deepak","Finance"),
(103,"Rohan","Management"),
(104,"Atul","HR"),
(105,"Prasanna","Finance");

select * from d2;

create table emp_tab(emp_id int,name  varchar(20),u_id int,
foreign key(u_id) references d2(id));

insert into emp_tab values(1,"Vaishnav",101),
(2,"Pranav",102),(3,"Viaks",103);

select * from emp_tab;

-- Q.7 Update the salary of the employee whose emp_id = 102 to 45000.

create table emp_sal(id int primary key,emp_name varchar(20),salary int);
insert into emp_sal values(101,"Vaishnav",50000),(102,"Rohit",40000);

select * from emp_sal;
update emp_sal set salary=45000 where id=102;
 select * from emp_sal;

 -- SET SQL_SAFE_UPDATES =0; --
 
 -- Q.8 Update the city of all students whose city is "pune" to "kolhapur".
 
 create table stud_1(id int,name varchar(20),city varchar(20));
 insert into stud_1 values(1,"Vivek","pune"),(2,"Ashish","Mahagaon"),(3,"Aryan","pune");
 
 select * from stud_1;
 update stud_1 set city="Kolhapur" where city="pune";
  select * from stud_1;

-- Q.9 Use ALTER TABLE to add a new column named email to the Student table.
 
 create table std_2 (id int,name varchar(20),address varchar(30));
 select * from std_2;
 alter table std_2 add column e_mail varchar(10);
  select * from std_2;

-- Q.10 Use ALTER TABLE to modify the name column from VARCHAR(20) to VARCHAR(50).
create table std_3 (id int,name varchar(20),address varchar(30));
alter table std_3 modify name varchar(50);
describe std_3;

-- Q.11 Use ALTER TABLE to add a CHECK constraint so that age >= 18.
create table std_4 (id int,name varchar(20), age int);
insert into std_4 values(1,"rutu",21),(2,"sahil",18),(3,"tushar",18);
alter table std_4 add constraint check(age>=18);
select * from std_4;

-- Q.12 Create a Customer table using:
-- PRIMARY KEY,NOT NULL,UNIQUE,DEFAULT,CHECK,Use all these constraints in one table.
 create table cust(id int primary key,name varchar(20) not null,roll_num int unique,
 clg_id int default 101,age int check(age>=18));
insert into cust values(1,'sahil',10,clg_id,20);
select * from cust;

-- Q.13Remove all records from the Student table using TRUNCATE.

create table student_1 (id int,name varchar(20),class int,address varchar(20));
insert into student_1 values (1,"Ashish",12,"Mahagaon"),(2,"Prasanna",13,"Kolhapur");
select * from student_1;
truncate table student_1;
select * from student_1;

-- Q.14 Delete the Product table completely using DROP.

create table student_2 (id int,name varchar(20),product varchar(30),address varchar(20));
insert into student_2 values (1,"Ashish","aaa","Mahagaon"),(2,"Prasanna","bbb","Kolhapur");
select * from student_2;
drop table student_2;
select * from student_2;

-- Q.15 Create a Library Management database with three tables:  Books,Members,Issue_Book
-- Use: PRIMARY KEY,FOREIGN KEY,NOT NULL,DEFAULT,Then insert at least 3 records into each table.

-- --------------------------------------->>>>
-- --------------------------------------->>>>
-- Q.1 Create a database named company and use it.
 use school;

-- Q.2 Create an employee table with: emp_id → Primary Key + Auto Increment ,name → NOT NULL,email → UNIQUE
 -- age → CHECK(age >= 18),city → DEFAULT 'Pune'
create table emp_51(emp11_id int auto_increment primary key ,name varchar(20) not null,
email varchar(50) unique,age int check(age>=18),city varchar(20) default 'pune');

insert into emp_51 (name,email,age,city) values("Ruturaj","ruturajredekar07@gmail.com",25,"Kolhapur"),
("Pranjal","pranjalredekar15@gmail.com",21,"Mumbai"),
("Aryan","aryanredekar18@gmail.com",18,"Kolhapur"),
("Sanika","sanikaredekar45@gmail.com",19,city),
("ashish","ashish45@gmail.com",25,city);
select * from emp_51;

-- Q.3 Use DESC to display the structure of the employee table.
describe emp_51;

-- Q.4 Insert 5 employees into the table.
create table em (emp_id int,emp_name varchar(20));
insert into em values(1,"Vinayak"),(2,"Kartik"),(3,"Vaishnav"),(4,"Prasanna"),(5,"Vivek");

-- Q.5 Display all employees using SELECT.
select * from em;

-- Q.6 Display only name and salary of employees whose salary is greater than 30000.
create table eemplo(emp_id int,emp_name varchar(20),salary int);
insert into eemplo values(1,"Vinayak",29000),(2,"Kartik",15000),(3,"Vaishnav",45000),
(4,"Prasanna",57000),(5,"Vivek",45000);
select * from eemplo;
select emp_name,salary from eemplo where (salary>30000);

-- Q.7 Find employees whose name starts with A using LIKE.
select * from eemplo where emp_name like 'P%';

-- Q.8 Find employees whose salary is between 25000 and 50000
select * from eemplo where salary between 25000 and 50000;

-- Q.9 Find employees who are from Pune, Mumbai, or Kolhapur using IN.
create table eemmpplo(emp_id int,emp_name varchar(20),city varchar(50));
insert into eemmpplo values(1,"Vinayak","Pune"),(2,"Kartik","Kowad"),(3,"Vaishnav","Kolhapur"),
(4,"Prasanna","pune"),(5,"Vivek","mumbai");
select * from eemmpplo;
select * from eemmpplo where city in ("Pune","mumbai","Kolhapur");

-- Q.10 Find employees who are from Pune AND have salary greater than 30000.
use school;
create table emm199(emp_id int,emp_name varchar(20),salary int,city varchar(30));
insert into emm199 values(1,"Vinayak",29000,"pune"),(2,"Kartik",15000,"Kolhapur"),(3,"Vaishnav",45000,"pune"),
(4,"Prasanna",57000,"kolhapur"),(5,"Vivek",45000,"pune");
select * from emm199;
select * from emm199 where (salary>30000) and city = "pune"; 

-- Q.11 Display unique cities using DISTINCT.
select distinct city from emm199;

-- Q.12 Display name as Employee_Name and salary as Monthly_Salary using Alias (AS).
select emp_name as Employee_Name, salary as Monthly_salary from emm199;

-- Q.13 Count the total number of employees using COUNT().
select count(emp_id) from emm199;

-- Q.14 Update the salary of the employee whose emp_id = 2 to 45000.
-- set sql_safe_updates =0;
 update emm199 set salary=45000 where emp_id=2;
-- set sql_safe_updates =1;
select * from emm199;

-- Q.15 Use ALTER and MODIFY: Add a phone column. Change the name column to VARCHAR(100).
alter table emm199 add column phone varchar(20);
alter table emm199 modify emp_name varchar(100);
select * from emm199;
describe emm199;

-- Q.16  OR  -- Find employees who are from Pune OR Kolhapur.
create table emmp199(emp_id int,emp_name varchar(20),salary int,city varchar(30));
insert into emmp199 values(1,"Vinayak",29000,"mahagaon"),(2,"Kartik",15000,"Kolhapur"),
(3,"Vaishnav",45000,"Pune"),(4,"Prasanna",57000,"Kolhapur"),(5,"Vivek",45000,"Pune");
select * from emmp199 where city="Pune" or city="Kolhapur";

-- Q.17 ENUM  -- Create a student table where gender can only be: Male, Female, or Other using ENUM.
use school;
create table std1112 (std_id int,name varchar(20),
Gender enum ('Male','Female','Other'));
insert into std1112 values (1,"Tushar","Male"),(2,"Vinayak","Male");
select * from std1112;

-- 18 FOREIGN KEY + REFERENCES Create a department table and an employee table 
 --   where dept_id in employee is a Foreign Key referencing department(dept_id).
 create table dept_ (id int primary key,std_name varchar(20));
 INSERT into dept_ values(4001,"Viaks"),(4002,"Sairaj"),(4003,"Rohan"),(4004,"Pranav");
 select * from dept_;
 
 create table emp_ (emp_id int primary key,emp_name varchar(20),cst_id int,
 foreign key emp_(cst_id) references dept_(id));
 INSERT into emp_ values(1,"Vaishnav",4001),(2,"sakila",4002),(3,"Ravi",4003),(4,"Raj",4004);
 select * from emp_;
 
 -- Q.19 TRUNCATE  Delete all records from the employee table while keeping the table structure.
use school;
create table a11(id int,name varchar(20));
insert into a11 values (1,"ssaaa"),(2,"daaaa");
truncate table a11;
select * from a11;

-- Q.20 DROP  Delete the employee table completely.
create table a111(id int,name varchar(20));
insert into a111 values (1,"ssaaa"),(2,"daaaa");
select * from a111;
drop table a111;
select * from a111;

use school;
-- solve 10 questins on 1 table
CREATE TABLE employee445 (emp_id INT AUTO_INCREMENT PRIMARY KEY,name VARCHAR(50),age INT,
city VARCHAR(30),department VARCHAR(30),salary DECIMAL(10,2));

INSERT INTO employee445 (name, age, city, department, salary)
VALUES ('Amit', 25, 'Pune', 'IT', 50000),('Rahul', 28, 'Mumbai', 'HR', 30000),
('Sneha', 24, 'Pune', 'IT', 60000),('Rohan', 30, 'Mumbai', 'Sales', 40000),
('Priya', 26, 'Pune', 'HR', 35000),('Neha', 27, 'Kolhapur', 'IT', 45000),
('Akash', 23, 'Pune', 'Sales', 28000),('Pooja', 29, 'Mumbai', 'HR', 32000),
('Vijay', 31, 'Kolhapur', 'Sales', 55000),('Kiran', 25, 'Pune', 'IT', 48000),
('Sagar', 27, 'Mumbai', 'Sales', 38000),('Riya', 24, 'Pune', 'HR', 42000);

-- Q.1 Find the total number of employees. (count())
select count(name) from employee445;

-- Q.2 Find the total salary paid to all employees. (sum())
select sum(salary) from employee445;

-- Q.3 Find the lowest and highest salary. (Min(),Max())
select min(salary),max(salary) from employee445;

-- Q.4 Find the average salary, rounded to 2 decimal places. (avg() + round())
select round(avg(salary)) from employee445;  -- for accurate avg
select round(avg(salary),2) from employee445;   -- for 2 decimal palces

-- Q.5 Display the top 3 highest-paid employees.  (order by + desc + limit)

select * from employee445 order by salary desc limit 3;

-- Q.6 Display all employees sorted by salary from lowest to highest. (order by + asc)

select * from employee445 order by salary asc;

-- Q.7 Find the number of employees in each city. (group by + count())

select city ,count(city)from employee445 group by city;

-- Q.8 Find the average salary of each department, rounded to 2 decimal places. (group by + avg() + round())

select department,round(avg(salary),2) from employee445 group by department;

-- Q.9 Find departments having more than 2 employees.  (group by,having)

select department,count(*) from employee445 group by department having count(*)>2;

-- Q.10 Display each employee's name and salary, 
	-- and create a new column salary_level: 
         -- Salary ≥ 50,000 → High Salary, ≥ 30,000 → Medium ,Otherwise → Low   (case when + then + else)
    
    select name,salary,
    case  
    when salary >=50000 then 'High salary'
    when salary >=30000 then 'Medium salary'
    else 'Low'
    end as salary_level
    from employee445;
    
    -- Q.Bonus Question : Find the average salary of each city, 
       -- show only cities whose average salary is greater than ₹30,000, 
           -- sort the result from highest average salary to lowest, and show only the top 2 cities.
     
     select city,(avg(salary)) from employee445 group by city 
     having avg(salary)> 30000 order by avg(salary) desc limit 2;
     
     -- ------------ > -------------->-=--------------->------------->
     
USE school;

-- Employee table
CREATE TABLE employee9 (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT,
    manager_id INT,
    salary INT
);

-- Employee data
INSERT INTO employee9 (emp_id, name, dept_id, manager_id, salary)
VALUES
(1, 'Amit', 101, 3, 50000),
(2, 'Rahul', 102, 3, 30000),
(3, 'Sneha', 101, NULL, 60000),
(4, 'Rohan', 105, 6, 40000),
(5, 'Priya', 103, 6, 35000),
(6, 'Neha', 104, NULL, 45000);

-- Department table
CREATE TABLE department9 (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

-- Department data
INSERT INTO department9 (dept_id, dept_name)
VALUES
(101, 'IT'),
(102, 'HR'),
(103, 'Sales'),
(104, 'Finance'),
(106, 'Marketing');
     
select * from employee9;
select * from department9;

-- Q.1 Display the employee name and department name for employees whose department exists.

select name,dept_name from employee9 
inner join department9
on employee9.dept_id=department9.dept_id;


-- Q.2 Display the employee name, department name and salary for employees working in the IT department.

select name,dept_name,salary from employee9
inner join department9 
on employee9.dept_id=department9.dept_id
where dept_name = 'IT';

-- Q.3 Find the number of employees in each department using INNER JOIN + GROUP BY.

select dept_name,count(emp_id) from employee9 
inner join department9 
on employee9.dept_id=department9.dept_id
group by dept_name;

-- Q.4 Display all employees along with their department names, 
     -- including employees whose department doesn't exist.

select name,dept_name
from employee9
left join department9
on employee9.dept_id=department9.dept_id;


-- Q.5 Find employees who do not have a matching department.

select name from employee9
left join department9
on employee9.dept_id=department9.dept_id
where department9.dept_id is null;


-- Q.6 Find the average salary of employees in each department, including departments with no employees.

select round(avg(salary),2),dept_name from department9
left join employee9
on department9.dept_id=employee9.dept_id
group by dept_name; 

-- Q.7 Display all departments and the employees working in them, including departments with no employees.

use school;
select dept_name,name 
from department9 
left join employee9
on department9.dept_id=employee9.dept_id;

-- Q.8 Find departments that have no employees.

select dept_name
from department9 
left join employee9
on department9.dept_id=employee9.dept_id
where employee9.name is null;


-- Q.9 Display all employees and all departments, including unmatched records.

select name,dept_name 
from employee9
left join department9
on employee9.dept_id=department9.dept_id
union
select name,dept_name 
from employee9
right join department9
on employee9.dept_id=department9.dept_id;

-- Q.10 Display every possible combination of an employee and a department

select name,dept_name
from employee9 
cross join department9;

-- Q.11 Find the total number of combinations produced by a CROSS JOIN.

select count(*)
from employee9
cross join department9;

-- Q.12 Display each employee's name along with their manager's name.

select e1.name as employee,e2.name as manager
from employee9 as e1
join employee9 as e2
on e1.manager_id=e2.emp_id;

-- Q.13 Find all employees who have no manager.

select name
from employee9 
where manager_id is null;

-- Q.14 display employee name | manager name | department name | salary

SELECT e1.name AS employee,
       e2.name AS manager,
       d.dept_name,
       e1.salary
FROM employee9 AS e1
JOIN employee9 AS e2
ON e1.manager_id = e2.emp_id
JOIN department9 AS d
ON e1.dept_id = d.dept_id;

-- Q.15 Find the number of employees managed by each manager,
   --  and display only managers who manage more than 1 employee.
   
   SELECT e2.name, COUNT(*) AS employee_count
FROM employee9 AS e1
JOIN employee9 AS e2
ON e1.manager_id = e2.emp_id
GROUP BY e2.name
HAVING COUNT(*) > 1;



