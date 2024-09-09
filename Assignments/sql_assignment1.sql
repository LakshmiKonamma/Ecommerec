CREATE TABLE Worker (
    WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    FIRST_NAME CHAR(25),
    LAST_NAME CHAR(25),
    SALARY INT(15),
    JOINING_DATE DATETIME,
    DEPARTMENT CHAR(25)
);

INSERT INTO Worker
    (WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
        (001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
        (002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
        (003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
        (004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
        (005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
        (006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
        (007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
        (008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');

CREATE TABLE Bonus (
    WORKER_REF_ID INT,
    BONUS_AMOUNT INT(10),
    BONUS_DATE DATETIME,
    FOREIGN KEY (WORKER_REF_ID)
        REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Bonus
    (WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
        (001, 5000, '16-02-20'),
        (002, 3000, '16-06-11'),
        (003, 4000, '16-02-20'),
        (001, 4500, '16-02-20'),
        (002, 3500, '16-06-11');
      
CREATE TABLE Title (
    WORKER_REF_ID INT,
    WORKER_TITLE CHAR(25),
    AFFECTED_FROM DATETIME,
    FOREIGN KEY (WORKER_REF_ID)
        REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Title
(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (001, 'Manager', '2016-02-20 00:00:00'),
 (002, 'Executive', '2016-06-11 00:00:00'),
 (008, 'Executive', '2016-06-11 00:00:00'),
 (005, 'Manager', '2016-06-11 00:00:00'),
 (004, 'Asst. Manager', '2016-06-11 00:00:00'),
 (007, 'Executive', '2016-06-11 00:00:00'),
 (006, 'Lead', '2016-06-11 00:00:00'),
 (003, 'Lead', '2016-06-11 00:00:00'), 
 (006, 'Lead', '2016-06-11 00:00:00'),
 (003, 'Lead', '2016-06-11 00:00:00');
 
 
select * from Worker;

-- Write a query to display all the first_name  in upper case
select upper(first_name) from worker;

-- Write a querty to display unique department from workers table
select distinct department from worker;

-- Write an SQL query to print the first three characters of FIRST_NAME from Worker table
select left(first_name,3) from worker;
select substr(first_name,1,3) from worker;

-- Write an SQL query to find the position of the alphabet (‘a’) in the first name column ‘Amitabh’ from Worker table.
SELECT POSITION('a' IN first_name) AS position_of_a 
FROM Worker
WHERE first_name = 'Amitabh';

-- Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length
select distinct department,length(department)as length_dept from worker;

-- Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending
select * from worker order by FIRST_NAME asc, DEPARTMENT desc;

-- Write a query to get workers whose name are Vipul and Satish
select * from worker where FIRST_NAME in('Vipul','Satish');
select * from worker where FIRST_NAME = 'Vipul' or FIRST_NAME = 'Satish';

-- Write an SQL query to print details of the Workers whose FIRST_NAME contains 'a'
select * from worker where FIRST_NAME like "%a%";

-- Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets
select * from worker where FIRST_NAME like "_____h";

-- Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000
select * from worker where salary between 100000 and 500000;

-- Write an SQL query to print details of the Workers who have joined in Feb’2014
select * from worker where JOINING_DATE LIKE '%2014-02%';

-- Write an SQL query to fetch the count of employees working in the department ‘Admin’
select department,count(department) from worker group by department;

-- Write an SQL query to fetch the no. of workers for each department in the descending order
select department,count(department) as no_of_workers from worker group by department order by no_of_workers desc ;

-- Write a query to display workerrs who are managers

SELECT W.WORKER_ID,W.FIRST_NAME,W.LAST_NAME,T.WORKER_TITLE,W.SALARY FROM WORKER W
JOIN TITLE T ON W.WORKER_ID = T.WORKER_REF_ID WHERE
T.WORKER_TITLE ="Manager";


-- Write query to find duplicate rows title table

SELECT WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM, COUNT(WORKER_REF_ID) as count1
FROM Title
GROUP BY WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM
HAVING count1 > 1;


 SELECT * FROM TITLE;

-- Write an SQL query to show all workers who got the bonus along with bonus amount
select * from bonus;
select * from worker;

SELECT W.WORKER_ID,W.FIRST_NAME,W.LAST_NAME,B.BONUS_AMOUNT FROM WORKER W 
JOIN  BONUS B ON W.WORKER_ID=B.WORKER_REF_ID;


-- Write a query to find employees in worker table that do not exist in bonus table (ie did not get bonus)

SELECT W.WORKER_ID,W.FIRST_NAME,W.LAST_NAME,W.SALARY,B.BONUS_AMOUNT FROM WORKER W 
LEFT JOIN  BONUS B ON W.WORKER_ID = B.WORKER_REF_ID WHERE B.BONUS_AMOUNT IS NULL ;

-- Write a query to find the highest 2 salaries
select distinct salary from worker order by salary desc limit 2;

-- Find 2nd highest without using TOP or LIMIT
SELECT MAX(Salary) FROM worker WHERE Salary NOT IN (SELECT MAX(Salary) 
    FROM worker);
    
-- Find people who have the same salary
SELECT *
FROM WORKER
WHERE Salary IN ( SELECT Salary FROM WORKER GROUP BY Salary HAVING COUNT(*) > 1);

SELECT * FROM WORKER AS W1 JOIN WORKER W2 ON W1.SALARY = W2.SALARY WHERE W1.WORKER_ID != W2.WORKER_ID; 
    
-- Write a query to fetch 1st 50% records without using Top


-- Write a query to select a department with more than 3 people in worker table
select DEPARTMENT, count(*) as no_of_workers from worker group by DEPARTMENT having no_of_workers > 3;

-- Write a query to select 1st and last row of a worker table
(SELECT * FROM WORKER ORDER BY WORKER_ID LIMIT 1)
UNION
(SELECT * FROM WORKER ORDER BY WORKER_ID DESC LIMIT 1);

-- Write a query to select last 5 entries from worker table

select * from worker order by worker_id desc limit  5;

-- Write a query to select people with highest salary in each group
select DEPARTMENT, max(salary) as max_salary from worker group by DEPARTMENT;

-- Write a query to fetch departments along with the total salaries paid for each of them
select DEPARTMENT, sum(salary) as total_salary from worker group by DEPARTMENT;

-- Write a query to fetch the names of workers who earn the highest salary
select * from worker;
select FIRST_NAME,LAST_NAME,SALARY FROM WORKER WHERE SALARY = (SELECT MAX(SALARY) FROM WORKER);