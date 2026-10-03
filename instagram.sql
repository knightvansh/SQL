CREATE DATABASE IF NOT EXISTS Instagram;
USE Instagram;
CREATE TABLE User (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    followers INT DEFAULT 0,
    following INT,
    age INT CHECK (age >= 13)
);

CREATE TABLE Post (
    id INT PRIMARY KEY,
    content VARCHAR(255),
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES User(id)
);
SHOW DATABASES;
use instagram;
SELECT * 
FROM user ;
WHERE followers > 100
limit 2;   -- limitclause --   Set the upper limit on the number of tuple rows to be returned. --

SELECT  name,age,followers
FROM user 
order by followers desc;    -- ORDERBY- Use for sorting the data in ascending(ASC) or descending order(DESC)  By default, the sorting is in ascending order if it does not return ascending or descending. . --


--  AGGREGATE FUN


 SELECT COUNT(*)
 FROM user
where age>14;                           -- total number of users
SELECT SUM(followers) FROM user;        -- total followers across all users
SELECT AVG(followers) FROM user;        -- average followers
SELECT MAX(followers) FROM user;        --  HIGHESTfollowers
SELECT MIN(followers) FROM user;        -- MINIMUM followers

 -- GROUP BY --Group the rows that have the same value into the summary rows. It collects the data from multiple reports and from the results by one or more columns. 
select  age,max(followers)
from user
group by age;

select  age,max(followers)
from user
group by age
having max(followers)>100;  -- HAVING-Similar to WHERE that is apply same condition on rows, but it is used when we want to apply ANY condition after grouping  and .grouping is necessary for having  --

SET SQL_SAFE_UPDATES=0;   -- DONE BEFORE MAKING CHANGES IN SQL TABLE--
-- GENERAL ORDER ---
-- UPDATE -Update the existing rows in the SQL table. --
update user
set followers=600
where age=16;

delete from user -- Delete the existing rows. --
where age =14;


ALTER TABLE user 
ADD COLUMN email VARCHAR(100);

ALTER TABLE user 
drop column age;

ALTER TABLE user 
rename to instauser;
ALTER TABLE instauser 
rename to user;



 -- TRUNCATE  -delete the whole table.  --
 truncate table user;
 


UPDATE user SET email = 'adam@gmail.com' WHERE id = 1;
UPDATE user SET email = 'bob@gmail.com' WHERE id = 2;
SELECT * FROM user;

SELECT name, age FROM user 
WHERE email IN ('bob@gmail.com', 'adam@gmail.com');

SELECT * FROM user ORDER BY followers DESC;
























