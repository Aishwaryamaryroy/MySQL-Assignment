CREATE TABLE teachers1 (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    subject VARCHAR(50),
    experience INT,
    salary DECIMAL(10, 2)
);

INSERT INTO teachers1 (name, subject, experience, salary)
VALUES
('Alice', 'Mathematics', 12, 55000),
('Bobby', 'Physics', 8, 48000),
('Cenny', 'Chemistry', 10, 50000),
('David', 'Biology', 15, 62000),
('Elsa', 'English', 6, 45000),
('Francis', 'History', 4, 42000),
('Gracy', 'Geography', 11, 53000),
('Honey', 'Computer Science', 9, 58000);

select * from teachers1;

DELIMITER $$

CREATE TRIGGER before_insert_teacher1
BEFORE INSERT ON teachers1
FOR EACH ROW
BEGIN
    IF NEW.salary < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Salary cannot be negative';
    END IF;
END$$

DELIMITER ;

INSERT INTO teachers1 (name, subject, experience, salary)
VALUES ('Mary', 'Art', 5, -1000);

CREATE TABLE teacher_log1 (
    id INT PRIMARY KEY AUTO_INCREMENT,
    teacher_id INT,
    action VARCHAR(50),
    timestamp DATETIME
);

DELIMITER $$

CREATE TRIGGER after_insert_teacher2
AFTER INSERT ON teachers1
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log1 (teacher_id, action, timestamp)
    VALUES (NEW.id, 'INSERT', CURRENT_TIMESTAMP);
END$$

DELIMITER ;


INSERT INTO teachers1 (name, subject, experience, salary)
VALUES ('Rose', 'Art', 5, 1000);
SELECT * FROM teacher_log1;

DELIMITER $$

CREATE TRIGGER before_delete_teacher1
BEFORE DELETE ON teachers1
FOR EACH ROW
BEGIN
    IF OLD.experience > 10 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete teachers with experience greater than 10 years';
    END IF;
END$$

DELIMITER ;

DELETE FROM teachers1
WHERE id = 1;

DELIMITER $$

CREATE TRIGGER after_delete_teacher1
AFTER DELETE ON teachers1
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log1 (teacher_id, action, timestamp)
    VALUES (OLD.id, 'DELETE',CURRENT_TIMESTAMP );
END$$

DELIMITER ;

DELETE FROM teachers1
WHERE id = 5;

select * from teacher_log1;







