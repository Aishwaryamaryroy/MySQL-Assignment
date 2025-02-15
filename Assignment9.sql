CREATE TABLE Worker1 (
    Worker_Id INT PRIMARY KEY,
    FirstName VARCHAR(25),
    LastName VARCHAR(25),
    Salary INT(15),
    JoiningDate DATE,
    Department VARCHAR(25)
);


INSERT INTO Worker1 (Worker_Id, FirstName, LastName, Salary, JoiningDate, Department) 
VALUES
(101, 'John', 'Doe', 50000, '2024-01-15', 'HR'),
(102, 'Jane', 'Smith', 60000, '2023-06-20', 'Finance'),
(103, 'Sam', 'Wilson', 55000, '2022-09-10', 'IT'),
(104, 'Emily', 'Davis', 75000, '2021-03-18', 'HR'),
(105, 'Michael', 'Brown', 80000, '2020-12-01', 'Finance');

-- 1. Stored Procedure to Insert a New Worker Record
DELIMITER $$

CREATE PROCEDURE AddWorker1(
    IN p_Worker_Id INT,
    IN p_FirstName VARCHAR(25),
    IN p_LastName VARCHAR(25),
    IN p_Salary INT(15),
    IN p_JoiningDate DATE,
    IN p_Department VARCHAR(25)
)
BEGIN
    INSERT INTO Worker (Worker_Id, FirstName, LastName, Salary, JoiningDate, Department)
    VALUES (p_Worker_Id, p_FirstName, p_LastName, p_Salary, p_JoiningDate, p_Department);
END$$

DELIMITER ;

CALL AddWorker(1, 'John', 'Davis', 50000, '2023-01-10', 'HR');

-- 2. Stored Procedure to Retrieve Salary by Worker_ID
DELIMITER $$
CREATE PROCEDURE GetWorkerSalary(
    IN p_Worker_Id INT,
    OUT p_Salary INT
)
BEGIN
    SELECT Salary INTO p_Salary FROM Worker WHERE Worker_Id = p_Worker_Id;
END$$
DELIMITER ;

CALL GetWorkerSalary(1, @p_Salary);
SELECT @p_Salary;

-- 3. Stored Procedure to Update Worker Department
DELIMITER $$
CREATE PROCEDURE UpdateWorkerDepartment(
    IN p_Worker_Id INT,
    IN p_Department CHAR(25)
)
BEGIN
    UPDATE Worker SET Department = p_Department WHERE Worker_Id = p_Worker_Id;
END $$
DELIMITER ;

CALL UpdateWorkerDepartment(1, 'Finance');

-- 4. Stored Procedure to Count Workers in a Department
DELIMITER $$
CREATE PROCEDURE GetWorkerCountByDepartment(
    IN p_Department CHAR(25),
    OUT p_WorkerCount INT
)
BEGIN
    SELECT COUNT(*) INTO p_WorkerCount FROM Worker WHERE Department = p_Department;
END $$
DELIMITER ;

CALL GetWorkerCountByDepartment('HR', @p_WorkerCount);
SELECT @p_WorkerCount;

-- 5. Stored Procedure to Calculate Average Salary in a Department
DELIMITER $$
CREATE PROCEDURE GetAvgSalaryByDepartment(
    IN p_Department CHAR(25),
    OUT p_AvgSalary DECIMAL(10,2)
)
BEGIN
    SELECT AVG(Salary) INTO p_AvgSalary FROM Worker WHERE Department = p_Department;
END $$
DELIMITER ;

CALL GetAvgSalaryByDepartment('HR', @p_AvgSalary);
SELECT @p_AvgSalary;
