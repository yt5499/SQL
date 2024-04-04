show databases;
create database april;
use april;

create table employee (
id int primary key,
name varchar(20),
gender varchar(7),
salary int
);

alter table employee drop primary key;
alter table employee add primary key (id);

show tables;
describe employee;
select * from employee;

insert into employee value(
1,
"Prakash",
"Male",
35000
);

insert into employee values
(2,"Rajan","Male",25000),
(3,"Ashwini","Female",33000),
(4,"Ramesh","Male",45000),
(5,"Abhishek","Male",55000),
(6,"Ankita","Female",45000),
(7,"Ruchir","Male",40000),
(8,"Sakshi","Female",38000),
(9,"Siddhi","Female",55000),
(10,"Varun","Male",50000);


-- lets perform some operations on the table 
-- Q1 add email column to existing table
alter table employee add (email varchar(30));

-- Q2 add values to email column
-- update employee set email = concat(name, '@gmail.com') where 1;				...where 1 = until true;
set sql_safe_updates=0;
update employee set email = concat(name, '@gmail.com');

-- Q3 select salaries between 20,000 to 40,000
select name, salary from employee where salary between 20000 and 40000;

-- Q4 fetch maximum salary
select max(salary) as maximum_salary from employee;
select name,salary from employee where salary = (select max(salary) from employee);
    
-- Q4 select 2nd maximum salary from table
select max(salary) as Maximum_salary from employee where salary < (select max(salary) from employee);
select name,salary from employee where salary = (select max(salary) from employee where salary < (select max(salary) from employee));

-- Q5 select 2nd minimum value
select min(salary) from employee where salary > (select min(salary) from employee);

-- Q6 fetch number of male and female emp in table
select count(*) from employee group by gender;
select gender, count(*) as count from employee group by gender;

-- Q7 update salary of all employees by 17.8%
update employee set salary = salary + salary * .178;

-- Q8 update salary of perticular employee by 50%
update employee set salary = salary + salary * .5 where id=10;

-- Thank you