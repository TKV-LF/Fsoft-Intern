--Ex2
Create database Employees
Use Employees

--Create table departments
Create table dbo.Departments(
dno int primary key,
dname nvarchar(255),
budget float);

--create table employees
Create table dbo.Employees(
ssn int primary key,
salary float,
phone varchar(11),
dno int,
Foreign Key (dno) References dbo.Departments (dno));


--Create table Children of employees
Create table dbo.ChildOfEm(
name nvarchar(255),
age char(10),
ssn int,
Foreign Key (ssn) References dbo.Employees (ssn));

--Insert values
Insert into Departments values (1, N'Hành Chính', 50000000)
Insert into Departments values (2, N'Nhân Sự', 30000000)
Insert into Departments values (3, N'Kỹ Thuật', 90000000)

Insert into Employees values (1, 6000000, '0977691072', 1)
Insert into Employees values (2, 3000000, '0977691071', 2)
Insert into Employees values (3, 7000000, '0977691073', 3)
Insert into Employees values (4, 9000000, '0977691074', 3)
Insert into Employees values (5, 8000000, '0977691075', 3)

Insert into ChildOfEm values (N'Hoàng','11', 1)
Insert into ChildOfEm values (N'Nhi','14', 2)
Insert into ChildOfEm values (N'Hùng','6', 3)

Select name, age, ssn from ChildOfEm where ssn = 2;
Select name, age, ssn from ChildOfEm where ssn = 1;

Select Employees.ssn,Employees.phone, Employees.salary, Departments.dname, Departments.budget from Employees inner join Departments on Employees.dno = Departments.dno

