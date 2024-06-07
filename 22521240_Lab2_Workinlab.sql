CREATE DATABASE E2

USE E2

CREATE TABLE Location(
    Locid NUMERIC(5, 0) NOT NULL,
    Room NVARCHAR(6) NOT NULL,
    Capacity NUMERIC(5, 0)
    CONSTRAINT PK_LOCATION PRIMARY KEY (Locid)
)
CREATE TABLE Term(
    Termid NUMERIC(5,0) NOT NULL,
    Tdesc VARCHAR(20) NOT NULL,
    Status VARCHAR(20) NOT NULL
    CONSTRAINT PK_TERM PRIMARY KEY (Termid)
)
CREATE TABLE Course (
    Cid NUMERIC(6,0) NOT NULL,
    Callid NVARCHAR(10) NOT NULL,
    Cname NVARCHAR(30) NOT NULL,
    Ccredit NUMERIC(2,0) NULL
    CONSTRAINT PK_Course PRIMARY KEY (Cid)
)
CREATE TABLE Faculty(
    Fid NUMERIC(4,0) NOT NULL,
    Flname NVARCHAR(25) NOT NULL,
    Ffname NVARCHAR(25) NOT NULL,
    Fphone NUMERIC(10,0) NULL,
    CONSTRAINT PK_Faculty PRIMARY KEY(Fid)
)
CREATE TABLE Course_Section(
    Csecid NUMERIC(8,0) NOT NULL,
    Cid NUMERIC(6,0) NOT NULL,
    Termid NUMERIC(5,0) NOT NULL,
    Secnum NUMERIC(2,0) NOT NULL,
    Fid NUMERIC(4,0) NULL,
    Locid NUMERIC(5,0) NULL,
    Maxenrl NUMERIC(4,0) NOT NULL,
    Currenrl NUMERIC(4,0) NOT NULL,
    CONSTRAINT PK_Course_Section PRIMARY KEY(Csecid)
)
ALTER TABLE Course_Section
ADD CONSTRAINT FK_Course_Section_Fid FOREIGN KEY(Fid) REFERENCES Faculty(Fid)
ALTER TABLE Course_Section
ADD CONSTRAINT FK_Course_Section_Locid FOREIGN KEY(Locid) REFERENCES Location(Locid)
ALTER TABLE Course_Section
ADD CONSTRAINT FK_Course_Section_Termid FOREIGN KEY(Termid) REFERENCES Term(Termid)
ALTER TABLE Course_Section
ADD CONSTRAINT FK_Course_Section_Cid FOREIGN KEY(Cid) REFERENCES Course(Cid)

CREATE TABLE Student(
    Sid NUMERIC(5,0) NOT NULL,
    Slname NVARCHAR(25) NOT NULL,
    Sfname VARCHAR(25) NOT NULL,
    Saddr NVARCHAR(30) NULL,
    Scity NVARCHAR(30) NULL,
    Sstate char(2) NULL,
    Szip NUMERIC(9,0) NULL,
    Sphone NUMERIC(10,0) NOT NULL,
    Sclass char(2) NULL,
    Sdob date NOT NULL,
    Fid NUMERIC(4,0) NULL,
    CONSTRAINT PK_Student PRIMARY KEY(Sid)
)
ALTER TABLE Student
ADD CONSTRAINT FK_Student_Fid FOREIGN KEY(Fid) REFERENCES Faculty(Fid)
CREATE TABLE Enrollment(
    Sid NUMERIC(5,0) NOT NULL,
    Csecid NUMERIC(8,0) NOT NULL,
    Grade CHAR(1) NULL,
    CONSTRAINT PK_Enrollment PRIMARY KEY(Sid,Csecid)
)
ALTER TABLE Enrollment
ADD CONSTRAINT FK_Enrollment_Sid FOREIGN KEY(Sid) REFERENCES Student(Sid)
ALTER TABLE Enrollment
ADD CONSTRAINT FK_Enrollment_Csecid FOREIGN KEY(Csecid) REFERENCES Course_Section(Csecid)
/*cau 1*/

/*1. Add column DESCRIPTION varchar(20) to Student table.*/
ALTER TABLE Student 
ADD Description VARCHAR(20)

/*2. Change column DESCRIPTION varchar(20) to varchar(50).*/
ALTER TABLE Student 
ALTER COLUMN Description VARCHAR(50)

/*3. Delete column DESCRIPTION from Student table.*/
ALTER TABLE Student 
DROP COLUMN Description

/*4. Add check constraint: Sclass field of Student table only contains
the following values: 'FR', 'SO', 'JR', 'SR', and 'GR'.*/
ALTER TABLE Student 
ADD CONSTRAINT CK_Sclass 
CHECK (Sclass in('FR', 'SO', 'JR', 'SR', 'GR'))

/*5. Add check constraint: Status field of Term table only contains the following values: 'OPEN' and 'CLOSED'.*/
ALTER TABLE Term 
ADD CONSTRAINT CK_Status CHECK(Status in ( 'OPEN', 'CLOSED'))

/*6. Add check constraint: Grade field of Enrollment table only contains the following values: 'A', 'B', 'C', 'D', 'F', 'I', and 'W'.*/
ALTER TABLE Enrollment 
ADD CONSTRAINT CK_Grade CHECK(grade in( 'A', 'B', 'C', 'D', 'F', 'I','W'))

/*7. Delete check constraint of table Enrollment.*/
ALTER TABLE Enrollment 
DROP CK_Grade

/*cau 2*/
/*1. Write a query that displays a list of all students.*/
SELECT * FROM Student 

/*2. Write a query that displays a list of all faculties showing the faculty Flname, Ffname, Fphone*/
SELECT Flname, Ffname, Fphone FROM Faculty

/*3. Write a query that displays each student name as a single field in the format 'firstname lastname' 
with a heading of Student, along with their phone number with a heading of Phone*/
SELECT CONCAT(Sfname, ' ', Slname) AS Student, Sphone AS Phone FROM Student;

/*4. Write a query that displays a list of all courses showing the course Callid, Cname, and Ccredit. 
Sort the results by course name.*/
SELECT Callid, Cname, Ccredit FROM Course order BY Cname;

/*5. Write a query that displays a list of all students showing the student Slname, Sfname, Scity. 
Only display students in 'Eau Claire' city*/
SELECT  Slname, Sfname, Scity FROM Student WHERE Scity LIKE 'Eau Claire'

/*6. Write a query that displays the student Slname, Sfname, Szip, and Scity from the student table. 
Use the LIKE operator to only display students that reside in any zipcode ending with 02*/
SELECT Slname, Sfname, Szip, Scity FROM Student WHERE Szip LIKE '%02'

/*7. Write a query that displays the student Slname, Sfname, Saddr, and Scity from the student table. 
Use the '!=' operator to only display students that do not live in Bloomer city*/
SELECT Slname, Sfname, Saddr, Scity FROM student WHERE Scity != 'Bloomer'


/*8. Write a query that displays a list of all students were born in 1979*/
SELECT * from Student WHERE YEAR(Sdob) =  '1979'

/*9. Write a query that displays a list of all students were born on Aug. 19, 1979*/
SELECT * FROM Student WHERE Sdob = 'Aug. 19, 1979'

/*10. Write a query that displays a list of all students were born in Oct 1977*/
SELECT * FROM Student WHERE YEAR(Sdob) = '1977' AND MONTH(Sdob) = '10'

/*11. Write a query to display the student Slname, Sfname, and Saddr 
but only display those students that have a faculty. */
SELECT Slname, Sfname, Saddr
FROM Student 
WHERE Fid IS NOT NULL

/*12. 
a. Create a statement to insert a new record into the Course table 
with the following values:
Cid: 4
Callid: MAT201
Cname: Linear Algebra
Ccredit: 2
b. Write a SELECT query to show the result of the INSERT statement 
to verify that the insert worked correctly.*/
INSERT INTO Course (Cid, Callid, Cname, Ccredit)
VALUES (4, 'MAT201', 'Linear Algebra', 2);

SELECT *
FROM Course
WHERE Cid = 4;


/*13. 
a. Create a statement to update the record inserted in the 
previous step to change the Ccredit of this course to 4.
b. Write a SELECT query to show the result of the UPDATE statement 
to verify that the update worked correctly.*/
UPDATE Course
SET Ccredit = 4
WHERE Cid = 4;

SELECT *
FROM Course
WHERE Cid = 4;


/*14. 
a. Create a statement to delete the entire record that was 
inserted and then updated in the previous steps.
b. Write a SELECT query to show the result of the DELETE statement 
to verify that the delete worked correctly*/
DELETE FROM Course
WHERE Cid = 4;

SELECT *
FROM Course
WHERE Cid = 4;