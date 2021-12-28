-- Option 2: Book Management
--Ex1
Create database BookManagement
Use BookManagement

--Create Table
--Author
Create table dbo.Author(
AuthorID int Identity(1,1) primary key,
AuthorFirstName nvarchar(255),
AuthorLastName nvarchar(255));

--BookFormat
Create table dbo.BookFormat(
BookFormat nvarchar(255) primary key,
FormatDescription nvarchar(255));

--Publisher
Create table dbo.Publisher(
PublisherID int Identity(1,1) primary key,
PublisherName nvarchar(255));

--Category
Create table dbo.Category(
CategoryID int Identity(1,1) primary key,
CategoryDescription nvarchar(255));

--BookTitle
Create table dbo.BookTitle(
ISBNNumber int primary key,
Title nvarchar(255),
PublishedDate date,
Pages int,
Price float,
BookFormat nvarchar(255),
PublisherID int,
Foreign Key (BookFormat) References dbo.BookFormat(BookFormat),
Foreign Key (PublisherID) References dbo.Publisher(PublisherID));

--BookCategory
Create table BookCategory(
ISBNNumber int,
CategoryID int,
Primary Key (ISBNNumber, CategoryID),
Foreign Key (ISBNNumber) References dbo.BookTitle (ISBNNumber),
Foreign Key (CategoryID) References dbo.Category (CategoryID));

--BookAuthor
Create table BookAuthor(
ISBNNumber int,
AuthorID int,
Primary Key (ISBNNumber, AuthorID),
Foreign Key (ISBNNumber) References dbo.BookTitle (ISBNNumber),
Foreign Key (AuthorID) References dbo.Author (AuthorID));

--Insert data
Insert into dbo.Author(AuthorFirstName, AuthorLastName) values ( N'Tuấn', N'Trần Văn');
Insert into dbo.Author(AuthorFirstName, AuthorLastName) values ( N'Hùng', N'Trần Văn');

Insert into dbo.BookFormat (BookFormat, FormatDescription) values (N'Tiểu thuyết', N'Đây là tiểu thuyết')
Insert into dbo.BookFormat (BookFormat, FormatDescription) values (N'Truyện ngắn', N'Đây là truyện ngắn')

Insert into dbo.Publisher (PublisherName) values (N'Anh Hùng')
Insert into dbo.Publisher (PublisherName) values (N'Hùng Anh')

Insert into dbo.Category values (N'Trung Quốc')
Insert into dbo.Category values (N'Việt Nam')

Insert into BookTitle values ('123425', N'Harry Potter', '12-mar-2013', '50', 45000, N'Tiểu thuyết', 1 )
Insert into BookTitle values ('123422', N'Dragonball', '12-mar-2011', '50', 25000, N'Truyện ngắn', 2 )

Insert into BookCategory values ('123425', 1)
Insert into BookCategory values ('123422', 2)

Insert into BookAuthor values ('123425', 2)
Insert into BookAuthor values ('123422', 3)

Select AuthorID, AuthorFirstName, AuthorLastName from Author;
Select ISBNNumber, Title, Pages, Price, BookFormat from BookTitle

--Ex2: Same option 1 ex 1
