
 CREATE DATABASE school;
USE school;

CREATE TABLE Student (
    rollno INT PRIMARY KEY,
    name VARCHAR(255),
    city VARCHAR(30),
    marks INT
);

show tables;
USE school;
INSERT INTO Student (rollno, name, city, marks) VALUES
(110, 'Adam', 'Delhi', 76),
(108, 'Bob', 'Mumbai', 65),
(124, 'Cassie', 'Pune', 94),
(122, 'David', 'Pune', 80);

-- marks >75--
select * from student
where marks>75;

-- Name of all the cities where students live --
select city 
from student 
group by city;

--  or--
select distinct city 
from student ;

--  Find maximum marks from each city. --
select city ,max(marks)
from student 
group by city;

-- Find the average of the class. --
select avg(marks)
from student;

--  Add a new column, grade. Assign the grade such that :Marks > 80, grade O,Marks: 70-80, Grade A ,Marks: 60 to 70, grade B ---
alter table student 
add column grade varchar(2);
show tables;
DESCRIBE student; -- describe whole table --

SET SQL_SAFE_UPDATES = 0;
UPDATE student 
SET grade = 'O' 
WHERE marks >= 80;

UPDATE student 
SET grade = 'A' 
WHERE marks >= 70 and marks <80;

UPDATE student 
SET grade = 'B' 
WHERE marks >= 60 and marks <70;
ALTER TABLE student DROP COLUMN grade;
select * from student;

ALTER TABLE student CHANGE rollno id INT;--  Change the student table rollno number to id To create a inner join with course id --


create table course(
  id int primary key,
  course varchar(50)
);
ALTER TABLE course CHANGE couse course VARCHAR(50);
DESCRIBE course;
INSERT INTO course (id,course) VALUES
(110,'english'),
(108,  'maths') ,
(124, 'Chemistry'),
(122, 'Physics');

UPDATE course SET id =112 WHERE id = 108;
UPDATE course SET id =120 WHERE id = 110;
 -- inner join  --Return the records that have matching values in both tables.  --
select*
from student  as s   -- Make the student as S called alias And the course as c Called as alias or temporary  Name for student table So to don't have to write the student and a big table name again and again  --
inner join course as c
on s.id=c.id;


-- left join -- Write all the record from the left table and the match record from the right table. --
select*
from student  as s   --  Make the student as S called alias And the course as c Called as alias or temporary  Name for student table So to don't have to write the student and a big table name again and again  --
left join course as c
on s.id=c.id;

-- right join --
select*
from student  as s   -- Make the student as S called alias And the course as c Called as alias or temporary  Name for student table So to don't have to write the student and a big table name again and again  --
 right join course as c
on s.id=c.id;


-- full join-Write all the records when there is a match in either the left or right table. --
select*
from student  as s   --  Make the student as S called alias And the course as c Called as alias or temporary  Name for student table So to don't have to write the student and a big table name again and again  --
left join course as c
on s.id=c.id
union
select*
from student  as s   -- Make the student as S called alias And the course as c Called as alias or temporary  Name for student table So to don't have to write the student and a big table name again and again  --
 right join course as c
on s.id=c.id;

-- Left exclusive join  -Return the left join excluding the common part with another table.  --
select*
from student  as s   --  Make the student as S called alias And the course as c Called as alias or temporary  Name for student table So to don't have to write the student and a big table name again and again  --
left join course as c
on s.id=c.id
where c.id is null;

--   right exclusive join. --

select*
from student  as s   --  Make the student as S called alias And the course as c Called as alias or temporary  Name for student table So to don't have to write the student and a big table name again and again  --
right join course as c
on s.id=c.id
where s.id is null;

-- self join=Regular join, but the table is joined with a cell.-treated as if it were two separate tables, using aliases to distinguish between the two "copies."  --
-- Table join with itself 
-- syntax--
SELECT a.column, b.column
FROM student a
JOIN student b ON <some condition>;

SELECT e.name AS employee, m.name AS manager
FROM employee e
JOIN employee m ON e.manager_id = m.employee_id;

--  find pairs of students from the same city: --
SELECT a.name AS student1, b.name AS student2, a.city
FROM student a
JOIN student b ON a.city = b.city AND a.id < b.id;


  --  SQL subqueries  --
-- Get the names of all students whose score is more than the class average. --
select name,marks
from student
WHERE marks > (SELECT AVG(marks) FROM student);


-- Find the name of all students with even roll numbers. --
select rollno
from student
where rollno % 2=0;





































