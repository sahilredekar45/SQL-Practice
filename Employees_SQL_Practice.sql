-- -----> -- -----> -- -----> -- -----> --<>-- <----- -- <----- -- <----- -- <----- --

use employees;

select * from employees;

-- Q.1 Find the total number of employees.
select count(emp_no) from employees;

-- Q.2 Find the number of male and female employees.
select sum(gender ='M'),sum(gender = 'F') from employees;

-- Q.3 Find the earliest and latest employee hire dates.
select min(hire_date),max(hire_date) from employees;

-- Q.4 Find employees hired after 1995.
select * from employees where year(hire_date) > 1995;

-- Q.5 Find employees born before 1960.
select * from employees where year (birth_date) < 1960;

-- Q.6  Find the top 10 oldest employees.
select * from employees order by birth_date asc limit 10;

-- Q.7  Find the youngest 10 employees.
select * from employees order by birth_date desc limit 10;

-- Q.8  Find the average employee age.
select avg(year(curdate()) - year(birth_date)) as avg_age from employees;

-- Q.9 Find the number of employees hired in each year.
select year(hire_date) as hire_year,count(*)as employee_count from employees group by year(hire_date);

-- Q.10  Find the number of employees hired in each decade.
select floor(year(hire_date)/10)*10 as decade,count(*)  
from employees group by floor(year(hire_date)/10)*10 order by decade ;

-- -----> -- -----> 
select * from salaries;

-- Q.11 Find the highest salary in the company.
select max(salary) from salaries;

-- Q.12 Find the lowest salary.
select min(salary) from salaries;

-- Q.13  Find the average salary.
select round(avg(salary)) from salaries;

-- Q.14 Find the median salary.
select avg(salary) as median_salary from (select salary from salaries 
order by salary limit 2 offset (select (count(*) - 1) div 2 from salaries)) as middle;

-- 15 Find the top 10 highest-paid employees.
select * from salaries order by salary desc limit 10;

-- Q.16 Find the bottom 10 lowest-paid employees.
select * from salaries order by salary asc limit 10;

-- Q.17 Find the second-highest salary.
select max(salary) from salaries where salary<(select max(salary) from salaries);

-- Q.18 Find the third-highest salary.
select max(salary) from salaries where salary<(select max(salary) from salaries 
where salary< (select max(salary)from salaries));

-- Q.19 Find the top 5 salaries without using LIMIT.
select emp_no,salary from (select emp_no,salary,dense_rank() over (order by salary desc ) 
as salary_rank from salaries) as x where salary_rank<=5;

-- Q.20  Find employees whose salary is greater than the company's average salary.
select * from salaries where  salary > (select avg(salary) from salaries);

-- -----> -- -----> 
select * from dept_emp;
select * from departments;

-- Q.21  Find the number of employees in each department.
select count(emp_no),dept_name from dept_emp 
inner join departments on dept_emp.dept_no=departments.dept_no
group by dept_name;

-- Q.22 Find the department with the highest number of employees.
select dept_name,max(emp_no) as max_emp from departments
join dept_emp on departments.dept_no=dept_emp.dept_no
group by dept_name order by max_emp desc;

-- Q.23 Find the department with the lowest number of employees.
select dept_name,min(emp_no) as min_emp from departments
join dept_emp on departments.dept_no=dept_emp.dept_no
group by dept_name order by min_emp asc;

-- -----> -- -----> 
select * from dept_emp;
select * from salaries;
select * from departments;

-- Q.24  Find the average salary of employees in each department.
select d.dept_no,de.dept_name,round(avg(salary)) as avg_sl from dept_emp as d 
join salaries on d.emp_no=salaries.emp_no
join departments as de on d.dept_no=de.dept_no
group by d.dept_no,de.dept_name;

-- Q.25 Find the department with the highest average salary
select d.dept_no,de.dept_name,round(avg(s.salary)) as Hig_avg_sal from dept_emp as d
join salaries as s on d.emp_no=s.emp_no
join departments as de on d.dept_no=de.dept_no
group by d.dept_no,de.dept_name
order by Hig_avg_sal desc limit 1;

-- Q.26 Find the department with the lowest average salary
select d.dept_no,de.dept_name,round(avg(s.salary)) as Hig_avg_sal from dept_emp as d
join salaries as s on d.emp_no=s.emp_no
join departments as de on d.dept_no=de.dept_no
group by d.dept_no,de.dept_name 
order by Hig_avg_sal asc limit 1;

-- Q.27 Find the total salary expense for each department
select d.dept_no,de.dept_name,sum(s.salary) as expense_sl from dept_emp as d
join salaries as s on d.emp_no=s.emp_no 
join departments as de on d.dept_no=de.dept_no
group by d.dept_no,de.dept_name;

-- Q.28 Find departments where the average salary is greater than the companys average
select d.dept_no,de.dept_name,round(avg(salary)) as avg_sl from dept_emp as d
join salaries as s on d.emp_no=s.emp_no
join departments as de on d.dept_no=de.dept_no
group by dept_no,dept_name
having avg(salary) > (select avg(salary) from salaries);

 
-- Q.29 Find the percentage of employees working in each department
select dept_no,count(*) * 100 / (select count(*) from dept_emp) as percentage 
from dept_emp group by dept_no having count(*) > 0; 

-- Q.30 Rank departments according to average salary
select d.dept_no,de.dept_name,round(avg(s.salary)) as avg_sal,
rank() over (order by avg(s.salary) desc) as dept_rank
 from dept_emp as d 
 join salaries as s 
 on d.emp_no=s.emp_no 
 join  departments as de 
 on d.dept_no=de.dept_no 
 group by d.dept_no,de.dept_name;

-- -----> -- -----> 
select * from employees;
select * from dept_emp;
select * from departments;
select * from salaries;

-- Q.31 Display :Employee name,Department,salary for every employee 
select e.first_name,e.last_name,d.dept_name,s.salary from employees as e
join dept_emp as de on e.emp_no=de.emp_no
join departments as d on de.dept_no=d.dept_no
join salaries as  s on e.emp_no=s.emp_no
where s.to_date = '9999-01-01'
and de.to_date = '9999-01-01';

-- Q.32 Find the highest-paid employee in each department.
select e.first_name,e.last_name,d.dept_name,max(s.salary) from employees as e
join dept_emp as de on e.emp_no=de.emp_no
join departments as d on d.dept_no=de.dept_no
join salaries as s on e.emp_no=s.emp_no 
group by e.first_name,e.last_name,d.dept_name;

-- -----> -- -----> --<>-- <----- -- <----- --
-- -----> -- -----> 

select * from employees;

-- Q.33 Display all employees.
select * from employees;

-- Q34. Display only employee first names.
select first_name from employees;

-- Q35. Display employee ID and employee name.
select emp_no,first_name,last_name from employees;

-- Q36. Find the total number of employees.
select count(*) from employees;

-- Q37. Find the number of male employees.
select count(gender) from employees where gender='M';

-- Q38. Find the number of female employees.
select count(gender) from employees where gender='F';

-- Q39. Find employees whose gender is M.
select * from employees where gender='M';

-- Q40. Find employees whose gender is F.
select * from employees where gender='F';

-- Q41. Find employees hired after 1990.
select * from employees where year(hire_date) > 1990;

-- Q42. Find employees hired before 1990.
select * from employees where year(hire_date) < 1990;

-- Q43. Find employees born after 1960.
select * from employees where year(birth_date) > 1960;

-- Q44. Find employees born before 1960.
select * from employees where year(birth_date) < 1960;

-- Q45. Find employees whose first name is Georgi.
select * from employees where first_name = 'Georgi';

-- Q46. Find employees whose first name starts with A.
select * from employees where first_name like 'A%';

-- Q47. Find employees whose last name starts with S.
select * from employees where last_name like '%S';

-- Q48. Find employees hired in 1995.
select * from employees where year(hire_date) like 1995;

-- Q49. Find the earliest hire date.
select min(hire_date) from employees;

-- Q50. Find the latest hire date.
select max(hire_date) from employees;

-- -----> -- -----> 
select * from salaries;

-- Q51. Find the highest salary.
select max(salary) as highest_salary from salaries;

-- Q52. Find the lowest salary.
select min(salary) as lowest_salary from salaries;

-- Q53. Find the average salary.
select avg(salary) from salaries;

-- Q54. Find the total salary.
select sum(salary) from salaries;

-- Q55. Find the top 5 highest salaries.
select * from salaries order by salary desc limit 5;

-- Q56. Find the bottom 5 salaries.
select * from salaries order by salary asc limit 5;

-- -----> -- -----> 
select * from employees;
-- Q57. Count employees hired in 1990.
select count(emp_no) from employees where year(hire_date) = 1990;

-- Q58. Count employees hired after 1995.
select count(emp_no) from employees where year(hire_date) > 1995;

-- Q59. Find employees whose salary is greater than 50,000.
select e.first_name,e.last_name,s.salary from employees as e
join salaries as s on e.emp_no=s.emp_no
group by e.first_name,e.last_name,s.salary
having salary > 50000 ;

-- Q60. Find employees whose salary is between 40,000 and 60,000.
select e.first_name,e.last_name,s.salary from employees as e
join salaries as s on e.emp_no=s.emp_no where salary between 40000 and 60000;

-- Q61. Find employees whose first name starts with M.
select * from employees where first_name like 'M%';

-- Q62. Find employees whose last name ends with son.
select * from employees where last_name like '%son';

-- -----> -- -----> 
select * from employees;
select * from dept_emp;

-- Q63. Display employee ID, first name, and department number.
select e.emp_no,e.first_name,d.dept_no from employees as e
join dept_emp as d on e.emp_no=d.emp_no
group by e.emp_no,e.first_name,dept_no;

-- Q64. Display employee first name and department name.
select * from departments;
select * from employees;
select * from dept_emp;
select e.first_name,d.dept_name from employees as e
join dept_emp as demp on e.emp_no=demp.emp_no
join departments as d on demp.dept_no=d.dept_no
group by e.first_name,d.dept_name;

-- Q65. Display employee ID, employee name, and department name.
select e.emp_no,e.first_name,e.last_name,d.dept_name from employees as e
join dept_emp as demp on e.emp_no=demp.emp_no
join departments as d on demp.dept_no=d.dept_no
group by e.emp_no,e.first_name,e.last_name,d.dept_name;

-- Q66. Find all employees who work in the Sales department.
select e.emp_no,e.first_name,e.last_name,dept_name from employees as e
join dept_emp as demp on e.emp_no=demp.emp_no
join departments as d on demp.dept_no=d.dept_no
where dept_name = 'Sales'
group by e.emp_no,e.first_name,e.last_name,dept_name;

-- Q67. Find all employees who work in the Development department.
select e.emp_no,e.first_name,e.last_name,dept_name from employees as e
join dept_emp as demp on e.emp_no=demp.emp_no
join departments as d on demp.dept_no=d.dept_no
where dept_name = 'Development'
group by e.emp_no,e.first_name,e.last_name,d.dept_name;

-- Q68. Find the total number of employees in the Sales department.
select count(e.emp_no) as total_employees,d.dept_name from employees as e
join dept_emp as de on e.emp_no=de.emp_no 
join departments as d on de.dept_no=d.dept_no
where d.dept_name = 'Sales'
group by d.dept_name;

-- Q69. Display all employees and their department names.
select e.emp_no,e.first_name,e.last_name,dept_name from employees as e
join dept_emp as de on e.emp_no=de.emp_no
join departments as d on de.dept_no=d.dept_no
group by e.emp_no,e.first_name,e.last_name,dept_name;

-- Q70. Find employees working in the Marketing department.
select e.emp_no,e.first_name,e.last_name,d.dept_name from employees as e
join dept_emp as demp on e.emp_no=demp.emp_no
join departments as d on demp.dept_no=d.dept_no
where dept_name = 'Marketing'
group by e.emp_no,e.first_name,e.last_name,d.dept_name;

-- Q71. Display employee first name, last name, and department name for employees whose first name starts with A.
select e.emp_no,e.first_name,e.last_name,d.dept_name from employees as e
join dept_emp as demp on e.emp_no=demp.emp_no
join departments as d on demp.dept_no=d.dept_no
where e.first_name like 'A%'
group by e.emp_no,e.first_name,e.last_name,d.dept_name;

-- Q72. Count how many employees are working in each department.
select count(e.emp_no),d.dept_name from employees as e
join dept_emp as de on e.emp_no=de.emp_no
join departments as d on de.dept_no=d.dept_no
group by d.dept_name;

-- Q73. Display employee first name and department name.
select e.first_name,dept_name from employees as e
join dept_emp as de on e.emp_no=de.emp_no
join departments as d on de.dept_no=d.dept_no
group by e.first_name,dept_name;

-- Q74. Display employee last name and department name.
select e.last_name,dept_name from employees as e
join dept_emp as de on e.emp_no=de.emp_no
join departments as d on de.dept_no=d.dept_no
group by e.emp_no,e.first_name,dept_name;

-- Q75. Display employee ID, first name, and department name.
select e.emp_no,e.first_name,dept_name from employees as e
join dept_emp as de on e.emp_no=de.emp_no
join departments as d on de.dept_no=d.dept_no
group by e.emp_no,e.first_name,dept_name;

-- Q76. Find all employees working in the Finance department.
select e.emp_no,e.first_name,e.last_name,d.dept_name from employees as e
join dept_emp as demp on e.emp_no=demp.emp_no
join departments as d on demp.dept_no=d.dept_no
where dept_name = 'Finance'
group by e.emp_no,e.first_name,e.last_name,d.dept_name;

-- Q77. Find all employees working in the Production department.
select e.emp_no,e.first_name,e.last_name,d.dept_name from employees as e
join dept_emp as demp on e.emp_no=demp.emp_no
join departments as d on demp.dept_no=d.dept_no
where dept_name = 'Production'
group by e.emp_no,e.first_name,e.last_name,d.dept_name;

-- Q78. Find all employees working in the Customer Service department.
select e.emp_no,e.first_name,e.last_name,d.dept_name from employees as e
join dept_emp as demp on e.emp_no=demp.emp_no
join departments as d on demp.dept_no=d.dept_no
where dept_name = 'Customer Service'
group by e.emp_no,e.first_name,e.last_name,d.dept_name;

-- Q79. Find all employees working in the Human Resources department.
select e.emp_no,e.first_name,e.last_name,d.dept_name from employees as e
join dept_emp as demp on e.emp_no=demp.emp_no
join departments as d on demp.dept_no=d.dept_no
where dept_name = 'Human Resources'
group by e.emp_no,e.first_name,e.last_name,d.dept_name;

-- Q80. Find all employees working in the Research department.
select e.emp_no,e.first_name,e.last_name,d.dept_name from employees as e
join dept_emp as demp on e.emp_no=demp.emp_no
join departments as d on demp.dept_no=d.dept_no
where dept_name = 'Research'
group by e.emp_no,e.first_name,e.last_name,d.dept_name;

-- Q81. Display employees who joined the company after 1995 along with their department name.
select e.emp_no,e.first_name,e.last_name,e.hire_date,d.dept_name from employees as e
join dept_emp as de on e.emp_no=de.emp_no
join departments as d on de.dept_no=d.dept_no
where year(hire_date) > 1995
order by d.dept_name,e.emp_no;

-- Q82. Display employees whose gender is M along with their department name.
select e.emp_no,e.first_name,e.last_name,e.gender,d.dept_name from employees as e
join dept_emp as de on e.emp_no=de.emp_no
join departments as d on de.dept_no=d.dept_no
where gender = 'M'
group by e.emp_no,e.first_name,e.last_name,e.gender,d.dept_name;

-- Q83. Display employees whose gender is F along with their department name.
select e.emp_no,e.first_name,e.last_name,e.gender,d.dept_name from employees as e
join dept_emp as de on e.emp_no=de.emp_no
join departments as d on de.dept_no=d.dept_no
where gender = 'F'
group by e.emp_no,e.first_name,e.last_name,e.gender,d.dept_name;

-- Q84. Display employees whose first name starts with A along with their department name.
select e.first_name,e.last_name,dept_name from employees as e
join dept_emp as de on e.emp_no=de.emp_no
join departments as d on de.dept_no=d.dept_no
where first_name like 'A%';

-- Q85. Display employees whose last name starts with S along with their department name.
select e.first_name,e.last_name,dept_name from employees as e
join dept_emp as de on e.emp_no=de.emp_no
join departments as d on de.dept_no=d.dept_no
where first_name like '%S';

-- Q86. Find the number of employees in the Finance department.
select count(e.emp_no) as total_employees,d.dept_name from employees as e
join dept_emp as de on e.emp_no=de.emp_no 
join departments as d on de.dept_no=d.dept_no
where d.dept_name = 'Finance'
group by d.dept_name;

-- Q87. Find the number of employees in the Sales department.
select count(e.emp_no) as total_employees,d.dept_name from employees as e
join dept_emp as de on e.emp_no=de.emp_no 
join departments as d on de.dept_no=d.dept_no
where d.dept_name = 'Sales'
group by d.dept_name;

-- Q88. Find the number of employees in the Marketing department.
select count(e.emp_no) as total_employees,d.dept_name from employees as e
join dept_emp as de on e.emp_no=de.emp_no 
join departments as d on de.dept_no=d.dept_no
where d.dept_name = 'Marketing'
group by d.dept_name;

-- Q89. Display employee first name, last name, and department name for employees hired after 1990.
select e.first_name,e.last_name,d.dept_name from employees as e
join dept_emp as de on e.emp_no=de.emp_no
join departments as d on de.dept_no=d.dept_no
where year(hire_date) > 1990
order by d.dept_name,e.emp_no;

-- Q90. Display employee name and department name for employees born before 1960.
select e.first_name,e.last_name,e.birth_date,d.dept_name from employees as e
join dept_emp as de on e.emp_no=de.emp_no
join departments as d on de.dept_no=d.dept_no
where year(birth_date) < 1960
order by d.dept_name,e.emp_no;

-- Q91. Display all department names with their employee IDs.
select e.emp_no,dept_name from employees as e
join dept_emp as de on e.emp_no=de.emp_no
join departments as d on de.dept_no=d.dept_no
group by e.emp_no,dept_name;

-- Q92. Count the number of employees in each department.
select count(e.emp_no),d.dept_name from employees as e
join dept_emp as de on e.emp_no=de.emp_no
join departments as d on de.dept_no=d.dept_no
group by d.dept_name;
