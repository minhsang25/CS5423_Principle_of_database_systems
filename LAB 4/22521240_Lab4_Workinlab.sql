USE Student

-- 1 Write a query to determine the total number of course sections on
-- each student. Display the Student Sid and the total with a heading of
-- TotalCsections. 
SELECT S.Sid, COUNT(*) AS TotalCsections
FROM Student S
GROUP BY S.Sid;

-- 2. Write a query to determine the total number of course sections on
-- each student. Display the Student Sid and the total with a heading of
-- TotalCsections.
-- Filter to only display information for total of 3 or higher.
SELECT S.Sid, COUNT(*) AS TotalCsections
FROM Student S
GROUP BY S.Sid
HAVING COUNT(*) >=3;

-- 3. Re-do query 2 but filter to only show those students with more than
-- 1 course sections enrolled. Sort by the number of course sections
-- enrolled, highest to lowest.

SELECT S.Sid, COUNT(*) AS TotalCsections
FROM Student S
GROUP BY S.Sid
HAVING COUNT(*) >1
ORDER BY TotalCsections DESC;

-- 4. The course_section table has a number of current enrollment
-- (Currenrl) for each course. Show the total Currenrl for each course.
-- Display the Course Cid and the total.
SELECT Cid,SUM(Currenrl)
FROM Course_Section 
GROUP BY Cid;

-- 5. Write a query to display the total number Currenrl for each
-- faculty: show the Fid and total. Sort by descending faculty on the
-- total and only display faculty with the total of 34 or more.
SELECT cs.Fid, SUM(cs.Currenrl) AS TotalCurrenrl
FROM Course_Section cs
GROUP BY cs.Fid
HAVING SUM(cs.Currenrl) >= 34
ORDER BY TotalCurrenrl DESC;

-- 6. Re-do query 5 but show the faculty name (formatted as a single
-- field with heading of Faculty) along with the phone, and total. Sort
-- by Ffname.
SELECT cs.Fid, CONCAT(f.Ffname, ' ', f.Flname) AS Faculty, f.Fphone, SUM(cs.Currenrl) AS TotalCurrenrl
FROM Course_Section cs
JOIN Faculty f ON cs.Fid = f.Fid
GROUP BY cs.Fid, f.Ffname, f.Flname, f.Fphone
HAVING SUM(cs.Currenrl) >= 34
ORDER BY f.Ffname ASC;

-- 7 Display the student Sid, and number of course sections that students
-- have enrolled in.
SELECT Sid, COUNT(Csecid) as Total_of_course_sections
FROM Enrollment
GROUP BY Sid;

-- 8 Display the student Sid, Sname (Slname + Sfname), and number of
-- course sections that students have enrolled in.
SELECT st.Sid, CONCAT(st.Slname,' ', st.Sfname) AS Name, cnt.Total_of_course_sections
FROM 
    (SELECT Sid, COUNT (Csecid) as Total_of_course_sections
    FROM Enrollment er
    GROUP BY Sid) cnt 
JOIN Student st ON cnt.Sid = st.Sid 

-- 9. Display the number of grade A per student. Show Sid, Slname,
-- Sfname, number of grade A with a heading of Quantity.
SELECT Student.Sid, Student.Slname, Student.Sfname, 
    COUNT(Enrollment.Grade) AS Quantity
FROM Student
LEFT JOIN Enrollment ON Student.Sid = Enrollment.Sid
WHERE Enrollment.Grade = 'A'
GROUP BY Student.Sid, Student.Slname, Student.Sfname;

-- 10. Use subqueries to determine which room has the highest Capacity?
SELECT Room
FROM [Location]
WHERE Capacity = (SELECT MAX(Capacity) FROM Location)

-- 11. Use SELECT TOP to determine which room has the highest Capacity?
SELECT TOP 1 Room
From [Location]
ORDER BY Capacity DESC

-- 12. USE A SUBQUERY to display names of student that have unenrolled
-- any course section.
SELECT CONCAT(st.Slname,' ', st.Sfname) AS Name
FROM Student st
WHERE Sid NOT IN (SELECT DISTINCT Sid FROM Enrollment);

-- 13. Display the number of students in Eau Claire city
SELECT COUNT(Sid)
FROM Student
WHERE Scity ='Eau Claire'

-- 14. Display the number of course_section by student: show student
-- Slname, Sfname, total. Sort by highest to lowest total.
SELECT st.Slname, st.Sfname, COUNT(Enrollment.Csecid) AS total
FROM Student st
LEFT JOIN Enrollment ON st.Sid = Enrollment.Sid
GROUP BY st.Sid, st.Slname, st.Sfname
ORDER BY total DESC;

-- 15. Determine which student had enrolled the most course section. (recommend làm theo cách này)
SELECT TOP 1 WITH TIES st.Sid, Slname, Sfname, COUNT(Csecid)
FROM Student st, Enrollment er
WHERE st.Sid = er.Sid
GROUP BY st.Sid, Slname, Sfname
ORDER BY COUNT(Csecid) DESC
--15 Another solution (using subqueries)
SELECT st.Sid, Slname, Sfname, COUNT(Csecid)
FROM Student st, Enrollment er
WHERE st.Sid = er.Sid
GROUP BY st.Sid, Slname, Sfname
HAVING COUNT(Csecid) >= ALL (SELECT COUNT(Csecid)
                            FROM Enrollment
                            GROUP BY Sid)
