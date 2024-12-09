CREATE DATABASE library;
USE library;

CREATE TABLE Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(255),
    Contact_no VARCHAR(15)
);

CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(100),
    Position VARCHAR(50),
    Salary DECIMAL(10,2),
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);

CREATE TABLE Books (
    ISBN INT PRIMARY KEY,
    Book_title VARCHAR(255),
    Category VARCHAR(100),
    Rental_Price DECIMAL(10,2),
    Status VARCHAR(3) CHECK (Status IN ('yes', 'no')),
    Author VARCHAR(100),
    Publisher VARCHAR(100)
);

CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(100),
    Customer_address VARCHAR(255),
    Reg_date DATE
);

CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(255),
    Issue_date DATE,
    Isbn_book INT,
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);

CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(255),
    Return_date DATE,
    Isbn_book2 INT,
    FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);

INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no)
VALUES 
(1, 101, 'Main Street, Bangalore', '9876543210'),
(2, 102, 'MG Road, Chennai', '8765432109'),
(3, 103, 'Park Avenue, Delhi', '7654321098');

INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no)
VALUES 
(101, 'Rajesh', 'Manager', 60000, 1),
(102, 'Neha', 'Manager', 65000, 2),
(103, 'Amit', 'Manager', 55000, 3),
(104, 'Suresh', 'Clerk', 30000, 1),
(105, 'Ravi', 'Assistant', 35000, 2),
(106, 'Sunita', 'Librarian', 45000, 3),
(107, 'Kiran', 'Clerk', 25000, 1),
(108, 'Megha', 'Librarian', 60000, 1);

INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher)
VALUES 
(111, 'History of India', 'History', 20.00, 'yes', 'Romila Thapar', 'Penguin'),
(112, 'World War II', 'History', 25.00, 'no', 'John Keegan', 'Random House'),
(113, 'Data Structures', 'Education', 30.00, 'yes', 'Seymour Lipschutz', 'McGraw-Hill'),
(114, 'Python Programming', 'Technology', 40.00, 'yes', 'Mark Lutz', 'OReilly'),
(115, 'Java Concepts', 'Technology', 35.00, 'yes', 'Cay Horstmann', 'Pearson'),
(116, 'Machine Learning', 'Technology', 50.00, 'no', 'Tom Mitchell', 'McGraw-Hill');

INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date)
VALUES 
(201, 'Arun', 'Bangalore', '2021-12-25'),
(202, 'Meera', 'Chennai', '2022-05-10'),
(203, 'Vishal', 'Delhi', '2020-03-15'),
(204, 'Priya', 'Mumbai', '2023-06-05'),
(205, 'Kavya', 'Bangalore', '2023-01-20');

INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book)
VALUES 
(301, 202, 'World War II', '2023-06-10', 112),
(302, 204, 'Python Programming', '2023-06-15', 114),
(303, 205, 'Machine Learning', '2023-07-01', 116);

INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2)
VALUES 
(401, 202, 'World War II', '2023-07-10', 112),
(402, 204, 'Python Programming', '2023-07-20', 114);

SELECT * FROM branch;
SELECT * FROM employee;
SELECT * FROM books;
SELECT * FROM customer;
SELECT * FROM issuestatus;
SELECT * FROM returnstatus;

SELECT Book_title, Category, Rental_Price
FROM Books
WHERE Status = 'yes';

SELECT Emp_name, Salary
FROM Employee
ORDER BY Salary DESC;

SELECT B.Book_title, C.Customer_name
FROM Books B
INNER JOIN IssueStatus I ON B.ISBN = I.Isbn_book
INNER JOIN Customer C ON I.Issued_cust = C.Customer_Id;

SELECT Category, COUNT(*) AS Total_Books
FROM Books
GROUP BY Category;

SELECT Emp_name, Position
FROM Employee
WHERE Salary > 50000;

SELECT Customer_name
FROM Customer
WHERE Reg_date < '2022-01-01' AND Customer_Id NOT IN (SELECT Issued_cust FROM IssueStatus);

SELECT Branch_no, COUNT(*) AS Total_Employees
FROM Employee
GROUP BY Branch_no;

SELECT C.Customer_name AS CustomerName, B.Book_title AS BookTitle, I.Issue_date AS IssueDate
FROM Customer C
INNER JOIN IssueStatus I ON C.Customer_Id = I.Issued_cust
INNER JOIN Books B ON I.Isbn_book = B.ISBN
WHERE I.Issue_date BETWEEN '2023-06-01' AND '2023-06-30';

SELECT Book_title
FROM Books
WHERE Book_title LIKE '%history%';

SELECT Branch_no, COUNT(*) AS Total_Employees
FROM Employee
GROUP BY Branch_no
HAVING COUNT(*) > 5;

SELECT E.Emp_name AS ManagerName, B.Branch_address AS BranchAddress
FROM Employee E
INNER JOIN Branch B ON E.Emp_Id = B.Manager_Id;

SELECT C.Customer_name AS CustomerName, B.Book_title AS BookTitle, B.Rental_Price AS RentalPrice
FROM Customer C
INNER JOIN IssueStatus I ON C.Customer_Id = I.Issued_cust
INNER JOIN Books B ON I.Isbn_book = B.ISBN
WHERE B.Rental_Price > 25;























