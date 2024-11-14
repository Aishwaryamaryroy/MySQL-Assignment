ALTER TABLE Persons
ADD DOB DATE;

UPDATE Persons SET DOB = '1990-05-12' WHERE Id = 1;
UPDATE Persons SET DOB = '1985-08-23' WHERE Id = 2;
UPDATE Persons SET DOB = '1992-11-30' WHERE Id = 3;
UPDATE Persons SET DOB = '2000-02-15' WHERE Id = 4;
UPDATE Persons SET DOB = '1994-06-18' WHERE Id = 5;
UPDATE Persons SET DOB = '1988-01-10' WHERE Id = 6;
UPDATE Persons SET DOB = '1995-04-22' WHERE Id = 7;
UPDATE Persons SET DOB = '1979-09-14' WHERE Id = 8;
UPDATE Persons SET DOB = '1982-12-01' WHERE Id = 9;
UPDATE Persons SET DOB = '1999-07-07' WHERE Id = 10;
UPDATE Persons SET DOB = '1983-08-01' WHERE Id = 11;
UPDATE Persons SET DOB = '1999-05-07' WHERE Id = 12;

SELECT * FROM PERSONS;

DELIMITER $$
CREATE FUNCTION age_calculator(dob date)
RETURNS INT
DETERMINISTIC
BEGIN
    declare age int;
    set age = year(curdate())-year(dob);
    return age;
END $$
DELIMITER ;


SELECT Id, Fname, Lname, DOB, age_calculator(DOB) AS Age
FROM Persons;

SELECT Country_name, LENGTH(Country_name) AS Name_Length
FROM Country;


SELECT Country_name, SUBSTRING(Country_name, 1, 3) AS First_Three_Chars
FROM Country;

SELECT Country_name, UPPER(Country_name) AS Country_Uppercase, LOWER(Country_name) AS Country_Lowercase
FROM Country;




