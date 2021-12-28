--Ex2:
Create database StudentManagement
Use StudentManagement

--Create table Student
Create table dbo.Student(
ssn int primary key,
Name nvarchar(255),
Major nvarchar(255),
Bdate date);

--Create table Text
Create table dbo.Text(
BookISBN varchar(255) primary key,
BookTitle nvarchar(255),
Publisher nvarchar(255),
Author nvarchar(255));

--Create table Course
Create table dbo.Course(
Course int primary key,
Cname nvarchar(255),
Dept nvarchar(255));

--Create table Enroll
Create table Enroll(
ssn int,
Course int,
Quarter char(10),
Grade float,
primary key (ssn, Course),
Foreign Key (ssn) References dbo.Student (ssn),
Foreign Key (Course) References dbo.Course (Course));

--Create table BookAdoption
Create table BookAdoption(
BookISBN varchar(255),
Course int,
Quarter char(10),
primary key (BookISBN, Course),
Foreign Key (BookISBN) References Text (BookISBN),
Foreign Key (Course) References Course (Course));

--Insert values
Insert into Student values (185, N'Tuấn', N'Công Nghệ', '23-Jan-2000')
Insert into Student values (186, N'Hùng', N'Kinh Tế', '21-Feb-2000')
Insert into Student values (187, N'Nam', N'Luyện Kim', '23-Mar-2000')

Insert into Text values (1,N'Sách 1', 'AH', N'Khải')
Insert into Text values (2,N'Sách 2', 'Ax', N'Chung')
Insert into Text values (3,N'Sách 3', 'AHy', N'Hiền')


Insert into Course values (1, N'Học 1', N'Đây là học 1')
Insert into Course values (2, N'Học 2', N'Đây là học 2')
Insert into Course values (3, N'Học 3', N'Đây là học 3')

Insert into Enroll values (185, 1, '3', 6.6)
Insert into Enroll values (186, 2, '5', 9.5)
Insert into Enroll values (187, 3, '4', 7.6)

Insert into BookAdoption values (1, 3, '4')
Insert into BookAdoption values (2, 1, '1')
Insert into BookAdoption values (3, 2, '3')

--Select test
Select ssn, Name, Major from Student
Select ssn, Name, Major from Student where ssn = 185

Select Text.BookISBN, Text.BookTitle, Text.Author, BookAdoption.Quarter, BookAdoption.Course from Text inner join BookAdoption on Text.BookISBN = BookAdoption.BookISBN

