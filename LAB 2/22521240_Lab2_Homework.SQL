CREATE DATABASE LAB2;

USE LAB2;

CREATE TABLE Shipment(
    SNo VARCHAR(5) NOT NULL,
    PNo VARCHAR(5) NOT NULL,
    Qty NUMERIC(5, 0) ,
    CONSTRAINT PK_Shipment PRIMARY KEY (SNo)
)
CREATE TABLE Part(
    PNo VARCHAR(5) NOT NULL,
    PName VARCHAR(20),
    Color VARCHAR(10),
    Weight FLOAT,
    City VARCHAR(20),
    CONSTRAINT PK_Part PRIMARY KEY (PNo)
)
CREATE TABLE Supplier(
    SNo VARCHAR(5) NOT NULL,
    SName VARCHAR(20),
    Status NUMERIC(2, 0),
    City VARCHAR(30),
    CONSTRAINT PK_Supplier PRIMARY KEY(SNo)
)
ALTER TABLE Shipment
ADD CONSTRAINT FK_Shipment_PNo FOREIGN KEY(PNo) REFERENCES Part(PNo)
ALTER TABLE Shipment
ADD CONSTRAINT FK_Shipment_SNo FOREIGN KEY(SNo) REFERENCES Supplier(SNo)

-- 1. Show full details of all suppliers.
SELECT * FROM Supplier;

-- 2. Show full details of all parts.
SELECT * FROM Part;

-- 3. Show full details of all shipments in London.
SELECT * FROM Supplier WHERE City = 'London';

-- 4. Show the part number(PNo), name and color of all parts located in London.
SELECT PNo, PName, Color * FROM Part WHERE City = 'Paris';

-- 5. Show the part number and name of all parts that weigh more than 15.
SELECT PNo, PName FROM Weight > 15;

-- 6. Show the part number and name of all parts that weigh more than 15 and are not red.
SELECT PNo, PName FROM Part WHERE Weight > 15 AND Color <> 'Red';

--7. Show the part number and name of all parts that weigh more than 15 and are neither red nor green.
SELECT PNO, PName FROM Part WHERE Weight > 15 AND Color NOT IN ('red', 'green');

--8. Show the part number and name of all parts that weigh between15 and 19 inclusive. Order the results by part name.
SELECT PNO, PName FROM Part WHERE Weight BETWEEN 15 AND 19 ORDER BY PName;

-- 33. Write an SQL statement to insert a new supplier: S6, Duncan, 30, Paris.
INSERT INTO Supplier (SNo, SName, Status, City) VALUES ('S6', 'Duncan', 30, 'Paris');

-- 34. Write an SQL statement to change S6’s city to Sydney.
UPDATE Supplier SET City = 'Sydney' WHERE SNo = 'S6';

-- 35. Write an SQL statement to increase each London supplier’s status by 10.
UPDATE Supplier SET Status = Status + 10 WHERE City = 'London';

-- 36. Write an SQL statement to delete supplier S6.
DELETE FROM Supplier WHERE SNo = 'S6';
