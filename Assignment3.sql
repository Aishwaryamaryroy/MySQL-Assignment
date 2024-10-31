CREATE TABLE Managers (
    Manager_Id INT PRIMARY KEY ,
    First_name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL,
    DOB DATE,
    Age INT CHECK (Age > 0),
    Last_update DATE,
    Gender CHAR(1) CHECK (Gender IN ('M', 'F')),
    Department VARCHAR(30) NOT NULL,
    Salary DECIMAL(10, 2) NOT NULL
);

INSERT INTO Managers (Manager_Id, First_name, Last_Name, DOB, Age, Last_update, Gender, Department, Salary) VALUES
(101, 'John', 'Davis', '1980-04-23', 44, '2024-10-31', 'M', 'IT', 30000),
(102, 'Aaliya', 'Mahesh', '1985-08-15', 39, '2024-10-31', 'F', 'HR', 28000),
(103, 'Robert', 'Sebastian', '1978-02-11', 46, '2024-10-31', 'M', 'Finance', 32000),
(104, 'Sophie', 'Mathew', '1990-06-30', 34, '2024-10-31', 'F', 'Marketing', 25000),
(105, 'Michael', 'Sunny', '1982-01-20', 42, '2024-10-31', 'M', 'IT', 29000),
(106, 'Sarah', 'Wilson', '1988-11-05', 36, '2024-10-31', 'F', 'Sales', 27000),
(107, 'David', 'Sony', '1975-03-19', 49, '2024-10-31', 'M', 'IT', 31000),
(108, 'Emily', 'Jones', '1992-09-13', 32, '2024-10-31', 'F', 'Finance', 34000),
(109, 'Cenny', 'Johnson', '1983-12-27', 41, '2024-10-31', 'M', 'HR', 26000),
(110, 'Olivia', 'Denvin', '1989-07-18', 35, '2024-10-31', 'F', 'Marketing', 24000);

SELECT First_name,Last_Name,DOB from managers where Manager_Id=101;

select First_name,Last_Name,Salary*12 as Annual_income from managers;

select * from managers where  First_name <> 'Aaliya';

SELECT * FROM Managers WHERE Department = 'IT' AND Salary > 25000;

SELECT * FROM Managers WHERE Salary BETWEEN 10000 AND 35000;