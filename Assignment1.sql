create database School;
use School;
create table Student ( 
Roll_no int,
Name varchar(50),
Marks decimal(10,2),
Grade varchar(5)
);
insert into student (Roll_no,Name,Marks,Grade) VALUES
(1,'Aishwarya',67.7,'C'),
(2,'Mary',89,'A'),
(3,'Roy',78.3,'B'),
(4,'Amrutha',98,'A'),
(5,'Rose',62,'C');

select * from student;
alter table student
add Contact varchar(50);
alter table student
drop column grade;
alter table student
rename to ClassTen;
truncate table classten;
drop table classten;


