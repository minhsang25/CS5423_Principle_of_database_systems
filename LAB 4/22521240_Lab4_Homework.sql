USE Parts

-- 21. How many suppliers are there?
SELECT COUNT(SNo) 
FROM Supplier

-- 22. How many suppliers are there in London?
SELECT COUNT(SNo) 
FROM Supplier
WHERE City = 'London'

-- 23. Show the maximum and minimum status values in the supplier table.
SELECT MAX([Status]) AS [Maximum status value], MIN([Status]) AS [Minimum status value]
FROM Supplier

-- 24. Show the maximum and minimum status values in the supplier table for London suppliers.
SELECT MAX([Status]) AS [Maximum status value], MIN([Status]) AS [Minimum status value]
FROM Supplier
WHERE City = 'London'

-- 25. How many parts has each supplier shipped? Show the supplier number (SNO) total shipped only.
SELECT Supplier.SNO, COUNT(Shipment.PNO) AS TotalShipped
FROM Supplier
LEFT JOIN Shipment ON Supplier.SNO = Shipment.SNO
GROUP BY Supplier.SNO;

-- 26. How many parts has each supplier shipped? Show the supplier number, name and city as well as the
-- total shipped. (Note: you will have to modify your group by statement. Why?)
SELECT sl.SNO, sl.SName, sl.City, COUNT(Shipment.PNO) AS TotalShipped
FROM Supplier sl
LEFT JOIN Shipment ON sl.SNO = Shipment.SNO
GROUP BY sl.SNO,sl.SName, sl.City;

-- 27. Which suppliers have shipped more than 500 parts in total? Show the supplier number only.
SELECT Supplier.SNO
FROM Supplier
JOIN Shipment ON Supplier.SNO = Shipment.SNO
GROUP BY Supplier.SNO
HAVING COUNT(Shipment.PNO) > 500;

-- 28. Which suppliers have shipped more than 300 red parts? Show the supplier number only.
SELECT Supplier.SNO
FROM Supplier
JOIN Shipment ON Supplier.SNO = Shipment.SNO
JOIN Part ON Shipment.PNO = Part.PNO
WHERE Part.Color = 'red'
GROUP BY Supplier.SNO
HAVING COUNT(Shipment.PNO) > 300;

-- 29. Which suppliers have shipped more than 300 red parts? Show the supplier number, name, and city and
-- the number of red parts shipped. (Note: you will have to modify your group by statement. Why?)
SELECT Supplier.SNO, Supplier.SName, Supplier.City, COUNT(Shipment.PNO) AS RedPartsShipped
FROM Supplier
JOIN Shipment ON Supplier.SNO = Shipment.SNO
JOIN Part ON Shipment.PNO = Part.PNO
WHERE Part.Color = 'red'
GROUP BY Supplier.SNO, Supplier.SName, Supplier.City
HAVING COUNT(Shipment.PNO) > 300;

-- 30. How many suppliers are there in each city?
SELECT sl.City, COUNT(Sno)
FROM Supplier sl
GROUP BY sl.City

-- 31. Which supplier has shipped the most parts? Show the name and number.
SELECT TOP 1 WITH TIES Supplier.SNO, Supplier.SName, COUNT(Shipment.PNO) AS TotalShipped
FROM Supplier
JOIN Shipment ON Supplier.SNO = Shipment.SNO
GROUP BY Supplier.SNO, Supplier.SName
ORDER BY TotalShipped DESC;

-- 32. Show a list of cities that have either suppliers or parts. In other words, show all the cities from the
-- supplier table and all the cities from the parts table. Show the results in a single column and remove
-- duplicates.
SELECT DISTINCT City 
FROM Supplier
UNION 
SELECT DISTINCT City
FROM Part