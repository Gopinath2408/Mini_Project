show databases;

create database project1;

use project1;


create table Books(
Book_Id int primary key,
Titile varchar(100) not null,
ISBN int unique not null,
Publication_year year not null,
Publisher_id int,
Category_id int,
Author_name varchar(100)check(Author_name!=null),
foreign key(Category_id) references Categories(Category_id) on delete cascade,
foreign key(Publisher_id) references Publishers(Publisher_id) on delete cascade
);

create table Categories(
Category_id int primary key,
Category_name varchar(100) unique not null
);

create table Publishers(
Publisher_id int primary key,
Publisher_name varchar(100) not null
);

create table Users(
User_id int primary key,
User_name varchar(100) not null,
Email varchar(100) unique not null,
Phone_number bigint unique not null
);


create table Borrowings(
Borrow_id int primary key,
User_id int,
Book_Id int,
Borrow_date date not null,
Return_date date not null,

foreign key(User_id) references Users(User_id) ON DELETE CASCADE,
foreign key(Book_Id) references books(Book_Id) ON DELETE CASCADE
);

INSERT INTO Categories (Category_id, Category_name) VALUES
(1, 'Fiction'),
(2, 'Science'),
(3, 'Technology'),
(4, 'History'),
(5, 'Biography'),
(6, 'Philosophy');


INSERT INTO Publishers (Publisher_id, Publisher_name) VALUES
(1, 'HarperCollins'),
(2, 'Simon & Schuster'),
(3, 'Macmillan'),
(4, 'Hachette'),
(5, 'O\'Reilly Media'),
(6, 'Wiley');


INSERT INTO Books (Book_Id, Titile, ISBN, Publication_year, Publisher_id, Category_id, Author_name) VALUES
(1, 'The Silent Patient',            123456789, 2019, 2, 1, 'Alex Michaelides'),
(2, 'A Brief History of Time',       234567801, 1988, 5, 3, 'Stephen Hawking'),
(3, 'Clean Code',                    345678912, 2008, 6, 4, 'Robert C. Martin'),
(4, 'Sapiens',                       456789023, 2011, 5, 2, 'Yuval Noah Harari'),
(5, 'Steve Jobs',                    567890134, 2011, 3, 3, 'Walter Isaacson'),
(6, 'Meditations',                   678901245, 2006, 2, 1, 'Marcus Aurelius');


INSERT INTO Users (User_id, User_name, Email, Phone_number) VALUES
(1, 'Rohit Sharma',   'rohit.sharma@outlook.com', 919812340102),
(2, 'Anita Desai',    'anita.desai@gmail.com',    919812340203),
(3, 'Alice',    'karan.mehta@yahoo.com',    919812340304),
(4, 'Sara Khan',      'sara.khan@proton.me',      919812340405),
(5, 'Vikram Joshi',   'vikram.joshi@live.com',    919812340506),
(6, 'Neha Patil',     'neha.patil@gmail.com',     919812340607);


INSERT INTO Borrowings (Borrow_id, User_id, Book_Id, Borrow_date, Return_date) VALUES
(1, 2, 2, '2025-09-22', '2025-10-06'),  
(2, 3, 3, '2025-10-01', '2025-10-15'),  
(3, 4, 4, '2025-08-19', '2025-09-02'), 
(4, 2, 5, '2025-07-08', '2025-07-23'),  
(5, 6, 6, '2025-10-09', '2025-10-23'),  
(6, 3, 3, '2025-09-11', '2025-09-25');  



-- Questions  
-- 1.
select * from Books;
select * from Categories;
select * from Publishers;
select * from Users;
select * from Borrowings;


-- 2.

 select Categories.Category_name, count(books.Category_id) as BookCount
 from books join 
 Categories on 
 books.Category_id = Categories.Category_id 
 group by books.Category_id
 having count(books.Category_id) > 1;
 
 
 -- 3.
 select books.Titile,Publishers.Publisher_name,books.Publication_year from books 
 join 
 Publishers 
 on 
 books.Publisher_id = Publishers.Publisher_id
 order by books.Publication_year desc;
 
 
 -- 4.
 select * from users 
 where User_id ins
 (select User_id from Borrowings group by User_id having count(user_id) > 1);
 
 
 -- 5
 
 select books.Titile from books 
 inner join 
 Borrowings on books.book_id = Borrowings.book_id
 inner join Users on Borrowings.user_id = users.user_id
 where users.user_name = 'ALice';
 
 
 -- 6 
 select Publishers.Publisher_id,Publishers.Publisher_name, count(books.book_id) as Book_Count
 from books
 join Publishers on
 books.Publisher_id = Publishers.Publisher_id 
 group by  books.Publisher_id
 order by Publishers.Publisher_name;
 

 









