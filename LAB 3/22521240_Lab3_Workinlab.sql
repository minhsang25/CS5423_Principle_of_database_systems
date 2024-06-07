USE LAB2
--1 
SELECT Course.Callid, Course.Cname, Course.Ccredit, Course_Section.Csecid
FROM Course
JOIN Course_Section
ON Course.Cid = Course_Section.Cid
WHERE Course_Section.Currenrl = 35;

--1 (way2) (recommended)
SELECT Course.Callid, Course.Cname, Course.Ccredit, Course_Section.Csecid
FROM Course, Course_Section
WHERE Course.Cid = Course_Section.Cid AND Course_Section.Currenrl = 35;

--2
SELECT Faculty.Flname, Faculty.Ffname, Faculty.Fphone, Course_Section.Csecid, Course_Section.Locid  
FROM Faculty
JOIN Course_Section
ON Faculty.Fid = Course_Section.Fid
WHERE Course_Section.Locid IN (53, 54);

--3
SELECT Course_Section.Csecid, Course_Section.Cid, Term.Tdesc
FROM Course_Section, Term
WHERE Course_Section.Termid = Term.Termid AND Term.Status = 'OPEN';

--4
SELECT Course.Callid, Course.Cname, Course.Ccredit
FROM Course
JOIN Course_Section
ON Course.Cid = Course_Section.Cid
JOIN Term
ON Course_Section.Termid = Term.Termid
WHERE Term.Status = 'OPEN' AND Term.Termid = 2;

--5
SELECT Student.Sid, Student.Slname, Student.Sfname, Student.Saddr, Student.Sdob
FROM Student
JOIN Enrollment
ON Student.Sid = Enrollment.Sid
JOIN Course_Section
ON Enrollment.Csecid = Course_Section.Csecid
JOIN Course
ON Course_Section.Cid = Course.Cid
WHERE Student.Sdob LIKE '%1979%' AND Callid = 'MIS101';

--6
SELECT DISTINCT Student.Slname, Student.Sfname, Student.Scity
FROM Student
JOIN Enrollment
ON Student.Sid = Enrollment.Sid
WHERE Enrollment.Grade = 'A';

--7
SELECT Course_Section.Locid, Room, Capacity 
FROM Course_Section, [Location], Term, Course
WHERE Course_Section.Locid = [Location].Locid AND
      Course_Section.Cid = Course.Cid AND
      Course.Callid = 'MIS101'AND 
      Tdesc = 'Summer 2004'

--8
SELECT Faculty.Fid, Flname, Ffname, Fphone, Cname, Ccredit
FROM Course, Course_Section, Faculty, Term
WHERE Course.Cid= Course_Section.Cid AND 
      Course_Section.Fid = Faculty.Fid AND
      Course_Section.Termid = Term.Termid AND
      Tdesc = 'Summer 2004'

--9 
SELECT Student.Sid, Student.Slname, Student.Sfname, Student.Scity, Enrollment.Csecid
FROM Student
JOIN Enrollment
ON Student.Sid = Enrollment.Sid
WHERE Enrollment.Grade IS NULL;

--10
SELECT Cname, Ccredit, Ffname+ ' ' + Faculty.Flname AS Faculty
FROM Course, Faculty, Course_Section
WHERE Course.Cid = Course_Section.Cid AND
      Course_Section.Fid = Faculty.Fid
ORDER BY Faculty.Ffname, Faculty.Flname;

--11
SELECT Student.Sid, Student.Sfname+' '+ Student.Slname AS [Student Name]
FROM Student
LEFT JOIN Enrollment
ON Student.Sid = Enrollment.Sid
WHERE Enrollment.Sid IS NULL;

--12
SELECT Fid
FROM Course_Section
WHERE Locid = 54
EXCEPT
SELECT Fid
FROM Course_Section
WHERE Locid = 53;

--13
SELECT Faculty.Fid, Flname, Ffname, Fphone
FROM Faculty, Course_Section
WHERE Faculty.Fid = Course_Section.Fid AND
      Course_Section.Locid = 54
EXCEPT 
SELECT Faculty.Fid, Flname, Ffname, Fphone
FROM Faculty, Course_Section
WHERE Faculty.Fid = Course_Section.Fid AND
      Course_Section.Locid = 53;

--14
SELECT Fid
FROM Course_Section
WHERE Locid = 54
INTERSECT
SELECT Fid
FROM Course_Section
WHERE Locid = 53;

--15
SELECT Sid
FROM Student
WHERE Student.Scity = 'Eau Claire'
UNION ALL 
SELECT Sid 
FROM Enrollment
WHERE Enrollment.Grade IS NULL;

--16
SELECT Student.Sid, Student.Sfname+' '+ Student.Slname AS [Student Name]
FROM Student
WHERE Sid NOT IN (SELECT Sid FROM Enrollment);

--17 
SELECT Fid
FROM Course_Section
WHERE Locid = 54 AND
      Fid NOT IN (SELECT Fid FROM Course_Section WHERE Locid = 53);

-- 18 
SELECT Fid
FROM Course_Section
WHERE Locid = 54 AND
      Fid IN (SELECT Fid FROM Course_Section WHERE Locid = 53);