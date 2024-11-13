SELECT Country.Country_name, Persons.Fname, Persons.Lname, Persons.Rating
FROM Country
INNER JOIN Persons ON Country.Id = Persons.Country_Id;

SELECT Country.Country_name, Persons.Fname, Persons.Lname, Persons.Rating
FROM Country
LEFT JOIN Persons ON Country.Id = Persons.Country_Id;

SELECT Country.Country_name, Persons.Fname, Persons.Lname, Persons.Rating
FROM Country
RIGHT JOIN Persons ON Country.Id = Persons.Country_Id;

SELECT DISTINCT Country_name FROM Country
UNION
SELECT DISTINCT Country_name FROM Persons;

SELECT Country_name FROM Country
UNION ALL
SELECT Country_name FROM Persons;

SELECT Id, Fname, Lname, ROUND(Rating) AS Rounded_Rating
FROM Persons;






