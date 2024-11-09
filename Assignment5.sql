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

SELECT LEFT(Country_name, 3) AS Country_Initial FROM Country;
SELECT CONCAT(Fname, ' ', Lname) AS Full_Name FROM Persons;
SELECT COUNT(DISTINCT Country_name) AS Unique_Countries FROM Persons;
SELECT MAX(Population) AS Max_Population FROM Country;
SELECT MIN(Population) AS Min_Population FROM Persons;
INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name)
VALUES (11, 'Alice', NULL, 700000, 4.4, 2, 'Canada'),
       (12, 'Tom', NULL, 900000, 4.0, 3, 'UK');

SELECT COUNT(Lname) AS Lname_Count FROM Persons;
SELECT COUNT(*) AS Row_Count FROM Persons;
SELECT Population FROM Country LIMIT 3;
SELECT * FROM Country ORDER BY RAND() LIMIT 3;
SELECT * FROM Persons ORDER BY Rating DESC;

SELECT Country_name, SUM(Population) AS Total_Population
FROM Persons
GROUP BY Country_name;

SELECT Country_name, SUM(Population) AS Total_Population
FROM Persons
GROUP BY Country_name
HAVING Total_Population > 50000;











