create database STUDENT_DB
GO 
USE STUDENT_DB
GO
CREATE TABLE Location
(
Locid NUMERIC(5) CONSTRAINT location_locid_pk PRIMARY KEY,
Room NVARCHAR(6) NOT NULL,
Capacity NUMERIC(5)
);

CREATE TABLE Faculty
(
Fid NUMERIC(4) CONSTRAINT faculty_fid_pk PRIMARY KEY,
Flname NVARCHAR(25) NOT NULL,
Ffname NVARCHAR(25) NOT NULL,
Fphone NUMERIC(10)
);

CREATE TABLE Student
(
Sid NUMERIC(5) CONSTRAINT student_sid_pk PRIMARY KEY,
Slname NVARCHAR(25) NOT NULL,
Sfname VARCHAR(25) NOT NULL,
Saddr NVARCHAR(30),
Scity NVARCHAR(30),
Sstate CHAR(2) DEFAULT 'WI',
Szip NUMERIC(9),
Sphone NUMERIC(10) NOT NULL,
Sclass CHAR(2) DEFAULT 'FR',
Sdob DATE NOT NULL,
Fid NUMERIC(4) 
);

ALTER TABLE Student
ADD CONSTRAINT student_fid_fk FOREIGN KEY (Fid)
REFERENCES Faculty;

CREATE TABLE Term
(
Termid NUMERIC(5) CONSTRAINT term_termid_pk PRIMARY KEY,
Tdesc VARCHAR(20) NOT NULL,
Status VARCHAR(20) NOT NULL
);


CREATE TABLE Course
(
Cid NUMERIC(6) CONSTRAINT course_cid_pk PRIMARY KEY,
Callid NVARCHAR(10) NOT NULL,
Cname NVARCHAR(30) NOT NULL,
Ccredit NUMERIC(2) DEFAULT '3'
);

CREATE TABLE Course_Section
(
Csecid NUMERIC(8) CONSTRAINT coursesection_csecid_pk PRIMARY KEY,
Cid NUMERIC(6) NOT NULL,
Termid NUMERIC(5) NOT NULL,
Secnum NUMERIC(2) NOT NULL,
Fid NUMERIC(4),
Locid NUMERIC(5),
Maxenrl NUMERIC(4) NOT NULL,
Currenrl NUMERIC(4) NOT NULL
);

ALTER TABLE Course_Section
ADD CONSTRAINT coursesection_cid_fk FOREIGN KEY (Cid)
REFERENCES Course;

ALTER TABLE Course_Section
ADD CONSTRAINT coursesection_termid_fk FOREIGN KEY (Termid)
REFERENCES Term;

ALTER TABLE Course_Section
ADD CONSTRAINT coursesection_fid_fk FOREIGN KEY (Fid)
REFERENCES Faculty;

ALTER TABLE Course_Section
ADD CONSTRAINT coursesection_locid_fk FOREIGN KEY (Locid)
REFERENCES Location;

CREATE TABLE Enrollment
(
Sid NUMERIC(5),
Csecid NUMERIC(8),
Grade CHAR(1),
CONSTRAINT enrollment_sid_csecid_pk PRIMARY KEY (Sid, Csecid)
);

ALTER TABLE Enrollment
ADD CONSTRAINT enrollment_sid_fk FOREIGN KEY (Sid)
REFERENCES Student;

ALTER TABLE Enrollment
ADD CONSTRAINT enrollment_csecid_fk FOREIGN KEY (Csecid)
REFERENCES Course_Section;

INSERT INTO Location
VALUES(53, '424', 45);

INSERT INTO Location
VALUES(54, '402', 35);

INSERT INTO Location
VALUES(55, '433', 100);


INSERT INTO Faculty
VALUES(10, 'Cox', 'Kim', 7155551234);

INSERT INTO Faculty
VALUES(11, 'Blanchard', 'Frank', 7155559087);

INSERT INTO Faculty
VALUES(12, 'McClure', 'William', 7155556409);


INSERT INTO Student
VALUES(100, 'McClure', 'Sarah', '144 Windridge Blvd.', 'Eau Claire', 'WI', 54703, 7155559876, 'SR', '14-JUL-1979', 10);

INSERT INTO Student
VALUES(101, 'Bowie', 'Jim', '454 St. John Street', 'Eau Claire', 'WI', 54702, 7155552345, 'SR', '19-AUG-1979', 11);

INSERT INTO Student
VALUES(102, 'Boone', 'Daniel', '8921 Circle Drive', 'Bloomer', 'WI', 54715, 7155553907, 'JR', '10-OCT-1977', 11);

INSERT INTO Student
VALUES(103, 'Jame', 'Bond', '8935 Circle Drive', 'El Paso', 'TX', 79835, 8907788982, 'GR', '20-OCT-1979', 11);
INSERT INTO Student
VALUES(104, 'Tim', 'Cook', '8932 Circle Drive', 'Bloomer', 'WI', 54715, 8907749876, 'GR', '22-OCT-1960', NULL);


INSERT INTO Term
VALUES(1, 'Spring 2004', 'CLOSED');

INSERT INTO Term
VALUES(2, 'Summer 2004', 'OPEN');


INSERT INTO Course
VALUES(1, 'MIS101', 'Intro. to Info. Systems', 3);

INSERT INTO Course
VALUES(2, 'MIS321', 'Systems Analysis and Design', 3);

INSERT INTO Course
VALUES(3, 'MIS349', 'Intro to Database Management', 3);


INSERT INTO Course_Section
VALUES(1000, 1, 2, 1, 12, 55, 100, 35);

INSERT INTO Course_Section
VALUES(1001, 1, 2, 2, 10, 54, 45, 35);

INSERT INTO Course_Section
VALUES(1002, 2, 2, 3, 10, 53, 35, 32);

INSERT INTO Course_Section
VALUES(1003, 3, 2, 1, 11, 54, 45, 35);


INSERT INTO Enrollment
VALUES(100, 1000, 'A');

INSERT INTO Enrollment
VALUES(100, 1003, 'A');

INSERT INTO Enrollment
VALUES(101, 1000, 'C');

INSERT INTO Enrollment
VALUES(102, 1000, 'C');

INSERT INTO Enrollment
VALUES(102, 1001, NULL);

INSERT INTO Enrollment
VALUES(102, 1003, 'I');

SELECT * FROM Location;

SELECT * FROM Faculty;

SELECT * FROM Student;

SELECT * FROM Term;

SELECT * FROM Course;

SELECT * FROM Course_Section;

SELECT * FROM Enrollment;
