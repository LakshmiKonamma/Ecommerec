USE classicmodels;

DROP TABLE IF EXISTS Student;

CREATE TABLE Student (
StdID INT(4) PRIMARY KEY, StdName VARCHAR(30) NOT NULL,
Sex VARCHAR(6), Percentage DECIMAL(5,2), SClass INT , 
Sec VARCHAR(1), Stream VARCHAR(10), DOB DATE );
INSERT INTO student (StdID, StdName, Sex, Percentage, SClass, Sec, Stream, DOB)
VALUES
    (1001, 'AKSHRA AGARWAL', 'FEMALE', 70, 11, 'A', 'Science', '1996-11-10'),
    (1002, 'ANJANI SHARMA', 'FEMALE', 75, 11, 'A', 'Commerce', '1996-09-18'),
    (1003, 'ANSHUL SAXENA', 'MALE', 78, 11, 'A', 'Commerce', '1996-11-19'),
    (1004, 'AISHWARYA SINGH', 'FEMALE', 79, 11, 'A', 'Commerce', '1996-11-01'),
    (1005, 'AKRITI SAXENA', 'FEMALE', 76, 11, 'A', 'Commerce', '1996-09-20'),
    (1006, 'KHUSHI AGARWAL', 'FEMALE', 77, 11, 'A', 'Commerce', '2003-09-14'),
    (1007, 'MAAHI AGARWAL', 'FEMALE', 74, 11, 'A', 'Science', '1997-04-21'),
    (1008, 'MITALI GUPTA', 'FEMALE', 78, 12, 'A', 'Science', '1997-11-26'),
    (1009, 'NIKUNJ AGARWAL', 'MALE', 58, 12, 'A', 'Science', '1997-07-12'),
    (1010, 'PARKHI', 'FEMALE', 59, 12, 'A', 'Commerce', '1997-12-20'),
    (1011, 'PRAKHAR TIWARI', 'MALE', 43, 12, 'A', 'Science', '1997-04-22'),
    (1012, 'RAGHAV GANGWAR', 'MALE', 58, 12, 'A', 'Commerce', '1997-12-21'),
    (1013, 'SAHIL SARASWAT', 'MALE', 57, 12, 'A', 'Commerce', '1997-08-13'),
    (1014, 'SWATI MISHRA', 'FEMALE', 98, 11, 'A', 'Science', '1996-08-13'),
    (1015, 'HARSH AGARWAL', 'MALE', 58, 11, 'B', 'Science', '2003-08-28'),
    (1016, 'HARSHIT KUMAR', 'MALE', 98, 11, 'B', 'Science', '2003-05-22'),
    (1017, 'JAHANVI KAPOOR', 'MALE', 65, 11, 'B', 'Science', '1997-01-10'),
    (1018, 'STUTI MISHRA', 'MALE', 66, 11, 'C', 'Commerce', '1996-01-10'),
    (1019, 'SURYANSH KUMAR AGARWAL', 'MALE', 85, 11, 'C', 'Commerce', '2007-08-22'),
    (1020, 'TANI RASTOGI', 'FEMALE', 75, 12, 'C', 'Commerce', '1998-01-15'),
    (1021, 'TANISHK GUPTA', 'MALE', 55, 12, 'C', 'Science', '1998-04-11'),
    (1022, 'TANMAY AGARWAL', 'MALE', 57, 11, 'C', 'Commerce', '1998-06-28'),
    (1023, 'YASH SAXENA', 'MALE', 79, 11, 'C', 'Science', '1998-03-13'),
    (1024, 'YESH DUBEY', 'MALE', 85, 12, 'C', 'Commerce', '1998-04-03');
    
    select count(*) from student;
SELECT * FROM student ;
SELECT * FROM student WHERE percentage >= 80;
SELECT StdName, Stream, Percentage from Student WHERE Percentage > 80;
SELECT * From student WHERE stream = 'Science' AND percentage > 75;
							
/*  LAB ACTIVITY 3 */
# 1.	To display the STUDENT table structure.
DESC STUDENT;

# 2.	To add a column (FIELD) in the STUDENT table, for example TeacherID as VARCHAR(20);
ALTER TABLE student ADD COLUMN TeacherID VARCHAR(20);

# 3.	Type the statement
DESC STUDENT;

# 4.	Type the statement and press enter key, note the new field that you have added as TeacherID
SELECT * FROM student;

# 5.	To modify the TeacherID data type form character to integer.
ALTER TABLE student MODIFY COLUMN TeacherID INT;
DESC Student;
SELECT * FROM student;

# 1.	To Drop (Delete) a field form a table. For e.g you want to delete TeacherID field.

ALTER TABLE Student DROP TeacherID;
DESC Student;
SELECT * FROM student;
# 2.	To subtract 5 form all students percentage and display name and percentage.

SELECT STDname, (percentage - 5) AS PERCENTAGE FROM Student;
SELECT StdName AS "Student Name",
DOB As "Date of Birth" FROM Student ;
#4.	Display the name of all students whose stream is not Science

SELECT StdName FROM student WHERE Stream <> 'Science';
ELECT StdName FROM student WHERE Stream  != 'Science';
#5.	Display all name and percentage where percentage is between 60 and 80

SELECT StdName, percentage FROM student WHERE percentage >=60 AND
percentage<=80 ;
SELECT StdName, percentage FROM student WHERE percentage between 60 AND 80 ;
# 4.	Display all the streams in student table.
SELECT DISTINCT Stream FROM Student;
# 5.	Note the output of the following statement.
SELECT StdName, Sex, Stream FROM Student WHERE percentage BETWEEN 70 AND 80;

# Create the Emp1 table
DROP TABLE IF EXISTS Emp1;
CREATE TABLE Emp1 (
    empno INT PRIMARY KEY,
    ename VARCHAR(30),
    job VARCHAR(30),
    mgr INT,
    hiredate DATE,
    sal DECIMAL(10, 2),
    comm DECIMAL(10, 2),
    deptno INT
);


INSERT INTO Emp1 (empno, ename, job, mgr, hiredate, sal, comm, deptno) VALUES
(8369, 'SMITH', 'CLERK', 8902, '1990-12-18', 800.00, NULL, 20),
(8499, 'ANYA', 'SALESMAN', 8698, '1991-02-20', 1600.00, 300.00, 30),
(8521, 'SETH', 'SALESMAN', 8698, '1991-02-22', 1250.00, 500.00, 30),
(8566, 'MAHADEVAN', 'MANAGER', 8839, '1991-04-02', 2985.00, NULL, 20),
(8654, 'MOMIN', 'SALESMAN', 8698, '1991-09-28', 1250.00, 1400.00, 30),
(8698, 'BINA', 'MANAGER', 8839, '1991-05-01', 2850.00, NULL, 30),
(8882, 'SHIVANSH', 'MANAGER', 8839, '1991-06-09', 2450.00, NULL, 10),
(8888, 'SCOTT', 'ANALYST', 8566, '1992-12-09', 3000.00, NULL, 20),
(8839, 'AMIR', 'PRESIDENT', NULL, '1991-11-18', 5000.00, NULL, 10),
(8844, 'KULDEEP', 'SALESMAN', 8698, '1991-09-08', 1500.00, 0.00, 30);

/*1.	Consider the Empl table and write SQL command to get the following.*/

# a.	Write a query to display EName and Sal of employees whose salary are greater than or equal to 2200?
select ename,sal from emp1 where sal >= 2200;

# b.	Write a query to display details of employs who are not getting commission?
select * from emp1 where comm is null;

# c.	Write a query to display employee name and salary of those employees who don’t have their salary in range of 2500 to 4000?
select ename,sal from emp1 where sal not between 2500 and 4000; 

# d.	Write a query to display the name, job title and salary of employees who don’t have manager?
select  e.ename as empname ,m.ename as manger from emp1 e left join emp1 m on e.empno=m.mgr where m.mgr is null;

# e.	Write a query to display the name of employee whose name contains “A” as third alphabet?
select ename from emp1 where ename like "__A%";

# f.	Write a query to display the name of employee whose name contains “T” as last alphabet?
select ename from emp1 where ename like "%T";

# g.	Write a query to display the name of employee whose name contains ”M” as First and “L” as third alphabet?
select ename from emp1 where ename like "M_L%";

# h.	Write a query to display details of employs with the text “Not given”, if commission is null?


select empno,ename,job,mgr,hiredate,sal,deptno,ifnull(comm,'Not given') as comm from emp1;
select empno,ename,job,mgr,hiredate,sal,deptno,CASE WHEN comm IS NULL THEN 'Not given'
													ELSE comm
												    END AS comm from emp1;
													
SELECT *, COALESCE(comm, 'Not given') AS comm FROM Emp1;
 
       
       









