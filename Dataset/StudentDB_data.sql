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
