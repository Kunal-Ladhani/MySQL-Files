create table employee (EmpID int, EmpFname varchar(15), EmpLname varchar(15), Department varchar(15), Project varchar(15),Address varchar(15), DOB date,Gender char, Salary int, primary key(EmpID));
desc employee;
SELECT * FROM EMPLOYEE;

-- Answers start here
-- 1
select * from employee where Department = "HR";
-- 2
select count(*) from employee where Gender = "F";
-- 3
select * from employee where Department = "HR" and Gender = "F";
-- 4
select EmpFname from employee where EmpFname like "a%" or "e%" or "i%" or "o%" or "u%";
-- 5
select * from employee where Gender = "M" and EmpFname like "_a%" or "_e%" or "_i%" or "_o%" or "_u%";
-- 6
select distinct Department from employee;
-- 7
select * from employee where Gender = "F" and Salary < 75000;
-- 8
select count(*) from employee where Salary between 50000 and 100000;
-- 9
select count(distinct project) from employee;
-- 10
select * from employee where department in (select distinct department from employee);