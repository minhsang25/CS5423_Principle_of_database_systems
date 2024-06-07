USE Parts

-- 9. Show full details of all parts that have been shipped by supplier S1. Use a join query and make sure no
-- duplicates appear in your output. (Note: it is recommended that you try both implicit and explicit joins.)
SELECT Part.PNo, PName, Color, Weight, Part.City
FROM Part, Shipment
WHERE Part.PNo = Shipment.PNo
AND Shipment.SNo = 'S1';

-- 10. Show full details of suppliers who have shipped part P1. Use a join query and make sure no duplicates
-- appear in your output.
SELECT DISTINCT Supplier.*
FROM Supplier
JOIN Shipment ON Supplier.SNo = Shipment.SNo
JOIN Part ON Part.PNo = Shipment.PNo
WHERE Part.PNo = 'P1';

-- 11. Show full details of suppliers who are located in London and have shipped parts that are located in
-- London. Use a join query and make sure no duplicates appear in your output.
SELECT DISTINCT Supplier.*
FROM Supplier
JOIN Shipment ON Supplier.SNo = Shipment.SNo
JOIN Part ON Shipment.PNo = Part.PNo
WHERE Supplier.City = 'London' AND Part.City = 'London';

-- 12. Repeat question 9 but use the IN operator.
SELECT DISTINCT Part.*
FROM Part
WHERE PNo IN (
    SELECT PNo
    FROM Shipment
    WHERE SNo = 'S1'
);

-- 13. Repeat question 10 but use the IN operator.
SELECT DISTINCT Supplier.*
FROM Supplier
WHERE SNo IN (
    SELECT SNo
    FROM Shipment
    WHERE PNo = 'P1'
);

-- 16. Repeat question 11 but use a subquery inside a subquery. Use the IN operator.
SELECT DISTINCT Supplier.*
FROM Supplier
WHERE SNo IN (
    SELECT SNo
    FROM Shipment
    WHERE City = 'London'
    AND PNo IN (
        SELECT PNo
        FROM Part
        WHERE City = 'London'
    )
);

-- 18. Show details of suppliers who have never made a shipment. Use the NOT IN operator.
SELECT *
FROM Supplier
WHERE SNo NOT IN (
    SELECT DISTINCT SNo
    FROM Shipment
);

-- 20. Show details of suppliers who have never made a shipment. Use an outer JOIN.
SELECT Supplier.*
FROM Supplier
LEFT JOIN Shipment ON Supplier.SNo = Shipment.SNo
WHERE Shipment.SNo IS NULL;
