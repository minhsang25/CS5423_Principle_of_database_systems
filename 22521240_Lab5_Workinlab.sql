USE SellingManagement
-- 38. Which orders have at least 4 different products.
SELECT ORDER_ID
FROM (
    SELECT ORDER_ID, COUNT(DISTINCT PRO_ID) AS NumProducts
    FROM ORDER_ITEMS
    GROUP BY ORDER_ID
) AS ProductCount
WHERE NumProducts >= 4;

-- 39. Which orders have at least 3 ‘Viet Nam’ products (3 different products)
SELECT ORDER_ID
FROM (
    SELECT ORDER_ID, COUNT(DISTINCT ORDER_ITEMS.PRO_ID) AS NumProducts
    FROM ORDER_ITEMS
    JOIN PRODUCTS ON ORDER_ITEMS.PRO_ID = PRODUCTS.PRO_ID
    WHERE COUNTRY = 'Viet Nam'
    GROUP BY ORDER_ID
) AS ProductCount
WHERE NumProducts >= 3

-- 40. Find all customers who have the highest orders.\
SELECT TOP 1 WITH TIES CUSTOMERS.CUST_ID, [NAME], COUNT(ORDER_ID) AS 'Highest Orders'
FROM CUSTOMERS, ORDERS
WHERE CUSTOMERS.CUST_ID = ORDERS.CUST_ID
GROUP BY CUSTOMERS.CUST_ID, [NAME]
ORDER BY COUNT(ORDER_ID) DESC

-- 41. In 2006, which months had the highest sum of total.
SELECT TOP 1 YEAR(ORDER_DATE) AS Year, MONTH(ORDER_DATE) AS Month, SUM(TOTAL) AS TotalSum
FROM ORDERS
WHERE YEAR(ORDER_DATE) = 2006
GROUP BY YEAR(ORDER_DATE), MONTH(ORDER_DATE)
ORDER BY TotalSum DESC;

-- 42. Which products have the lowest total quantity in 2006
SELECT TOP 1 YEAR(ORDER_DATE) AS Year, MONTH(ORDER_DATE) AS Month, SUM(TOTAL) AS TotalSum
FROM ORDERS
WHERE YEAR(ORDER_DATE) = 2006
GROUP BY YEAR(ORDER_DATE), MONTH(ORDER_DATE)
ORDER BY TotalSum ;

-- 43. *Each country, find products that have the highest selling price.
SELECT COUNTRY, PRO_ID, PRO_NAME, MAX(PRICE) AS [highest selling price]
FROM PRODUCTS A
GROUP BY COUNTRY, PRO_ID, PRO_NAME
HAVING MAX(PRICE) >= ALL (
    SELECT MAX(PRICE)
    FROM PRODUCTS B 
    GROUP BY COUNTRY, PRO_ID
    HAVING A.COUNTRY = B.COUNTRY
)

-- 44. Find all countries that make at least three products that have different selling prices.
SELECT COUNTRY 
FROM PRODUCTS
GROUP BY COUNTRY
HAVING COUNT (DISTINCT PRICE) >= 3