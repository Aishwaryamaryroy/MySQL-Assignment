
CREATE TABLE Country (
    Id INT PRIMARY KEY,
    Country_name VARCHAR(50),
    Population INT,
    Area INT
);


CREATE TABLE Persons (
    Id INT PRIMARY KEY,
    Fname VARCHAR(50),
    Lname VARCHAR(50),
    Population INT,
    Rating DECIMAL(3, 1),
    Country_Id INT,
    Country_name VARCHAR(50)
    
);

INSERT INTO Country (Id, Country_name, Population, Area) VALUES
(1, 'USA', 331000000, 9833520),
(2, 'Canada', 38000000, 9984670),
(3, 'UK', 67000000, 243610),
(4, 'India', 1380000000, 3287263),
(5, 'Australia', 25600000, 7692024),
(6, 'Germany', 83000000, 357022),
(7, 'France', 67000000, 551695),
(8, 'Japan', 1258000, 377975),
(9, 'Brazil', 213000000, 8515767),
(10, 'South Africa', 59300000, 1221037);

INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES
(1, 'John', 'Mathew', 500000, 4.2, 1, 'USA'),
(2, 'Jane', 'Sunny', 1200000, 4.8, 2, 'Canada'),
(3, 'Mary', 'Johnson', 750000, 3.9, 3, 'UK'),
(4, 'James', 'Benny', 1100000, 4.1, 4, 'India'),
(5, 'Parvathy', 'Suresh', 200000, 3.7, 5, 'Australia'),
(6, 'Michael', 'Anthony', 1500000, 4.5, 6, 'Germany'),
(7, 'Linda', 'Davis', 670000, 4.9, 1, 'USA'),
(8, 'Robin', 'Thomas', 800000, 3.6, 8, 'Japan'),
(9, 'William', 'Berly', 900000, 4.3, 9, 'Brazil'),
(10, 'Elizabeth', 'Francis', 590000, 3.5, NULL, NULL);

SELECT DISTINCT Country_name FROM Persons;
SELECT Fname AS First_Name, Lname AS Last_Name FROM Persons;
SELECT * FROM Persons WHERE Rating > 4.0;
SELECT * FROM Country WHERE Population > 1000000;
SELECT * FROM Persons WHERE Country_name = 'USA' OR Rating > 4.5;
SELECT * FROM Persons WHERE Country_name IS NULL;
SELECT * FROM Persons WHERE Country_name IN ('USA', 'Canada', 'UK');
SELECT * FROM Persons WHERE Country_name NOT IN ('India', 'Australia');
SELECT * FROM Country WHERE Population BETWEEN 500000 AND 2000000;
SELECT * FROM Country WHERE Country_name NOT LIKE 'C%';










