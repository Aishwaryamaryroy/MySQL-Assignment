SELECT Country_name, COUNT(*) AS Number_of_Persons
FROM Persons
GROUP BY Country_name;

SELECT Country_name, COUNT(*) AS Number_of_Persons
FROM Persons
GROUP BY Country_name
ORDER BY Number_of_Persons DESC;

SELECT Country_name, AVG(Rating) AS Average_Rating
FROM Persons
GROUP BY Country_name
HAVING AVG(Rating) > 3.0;

SELECT Country_name 
FROM Persons
WHERE Rating = (SELECT AVG(Rating) 
                FROM Persons 
                WHERE Country_name = 'USA')
GROUP BY Country_name;

SELECT Country_name,Population
FROM Country
WHERE Population > (SELECT AVG(Population) FROM Country);

CREATE DATABASE Product;

USE Product;

CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    First_name VARCHAR(50),
    Last_name VARCHAR(50),
    Email VARCHAR(100),
    Phone_no VARCHAR(15),
    Address VARCHAR(255),
    City VARCHAR(50),
    State VARCHAR(50),
    Zip_code VARCHAR(10),
    Country VARCHAR(50)
);
USE Product;

INSERT INTO Customer (Customer_Id, First_name, Last_name, Email, Phone_no, Address, City, State, Zip_code, Country)
VALUES 
(1, 'John', 'Davis', 'john.davis@gmail.com', '123-456-7890', '123 Elm St', 'Los Angeles', 'California', '90001', 'USA'),
(2, 'Jane', 'Sunny', 'jane.sunny@gmail.com', '987-654-3210', '456 Oak St', 'San Francisco', 'California', '94101', 'USA'),
(3, 'Michael', 'Benny', 'michael.benny@gmail.com', '456-789-0123', '789 Pine St', 'Dallas', 'Texas', '75001', 'USA'),
(4, 'Emily', 'Davis', 'emily.davis@gmail.com', '321-654-9870', '101 Maple St', 'Austin', 'Texas', '73301', 'USA'),
(5, 'Daniel', 'Wilson', 'daniel.wilson@gmail.com', '654-321-4567', '202 Birch St', 'Seattle', 'Texas', '98101', 'USA'),
(6, 'Sophia', 'Taylor', 'sophia.taylor@gmailcom', '789-012-3456', '303 Cedar St', 'Miami', 'Texas', '33101', 'USA'),
(7, 'Olivia', 'Martin', 'olivia.martin@gmail.com', '234-567-8901', '404 Walnut St', 'New York', 'Texas', '10001', 'USA'),
(8, 'Liam', 'Garcia', 'liam.garcia@gmail.com', '345-678-9012', '505 Ash St', 'Albany', 'New York', '12201', 'USA'),
(9, 'Noah', 'Rody', 'noah.rody@gmail.com', '567-890-1234', '606 Spruce St', 'Phoenix', 'Texas', '85001', 'USA'),
(10, 'Emma', 'Lenny', 'emma.lenny@gmail.com', '678-901-2345', '707 Fir St', 'Denver', 'Colorado', '80201', 'USA');


CREATE VIEW customer_info AS
SELECT CONCAT(First_name, ' ', Last_name) AS Full_name, Email
FROM Customer;

SELECT * FROM customer_info;

CREATE VIEW US_Customers AS
SELECT * 
FROM Customer
WHERE Country = 'USA';

SELECT * FROM US_Customers;

CREATE VIEW Customer_details AS
SELECT CONCAT(First_name, ' ', Last_name) AS Full_name, Email, Phone_no, State
FROM Customer;

SELECT * FROM Customer_details;

UPDATE Customer_details
SET Phone_no = '123-456-7899'
WHERE State = 'California';

SELECT * FROM Customer_details;

SELECT State, COUNT(*) AS NumberOfCustomers
FROM Customer
GROUP BY State
HAVING COUNT(*) > 5;

SELECT State, COUNT(*) AS NumberOfCustomers
FROM Customer_details
GROUP BY State;

SELECT * 
FROM Customer_details
ORDER BY State ASC;


