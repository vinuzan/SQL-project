Use Northwind

--1. How many Orders?
SELECT COUNT(*) FROM Orders

--2 and 3. How many orders Shipped to Rio De Janeiro or Reims
SELECT COUNT(*) FROM Orders
WHERE ShipCity = 'Rio de Jeneiro' or ShipCity = 'Reims'

--4. Select all z/Z from Customers
SELECT CompanyName FROM Customers
WHERE CompanyName Like '%z%'

--5. Company with no FAX number
SELECT ContactName, Phone, City FROM Customers
WHERE Fax is NULL

--6. Re-locate customers in Paris
SELECT * FROM Customers
WHERE City = 'Paris'

--7. Top 5 From Paris who Ordersd most
SELECT * FROM Customers
WHERE City = 'Paris'

SELECT * FROM Orders

SELECT TOP 5 Customers.CustomerID,[Order Details].Quantity FROM Customers
--All 3 tables have been joined
JOIN Orders ON Orders.CustomerID = Customers.CustomerID
JOIN [Order Details] ON [Order Details].OrderID = Orders.OrderID
WHERE City = 'Paris'
GROUP BY Customers.CustomerID

--8. Pari's CLient's Delivery that took longer than 10days

Use Northwind
SELECT Customers.CompanyName,
CASE WHEN DATEDIFF(dd, Orderdate, ShippedDate) > 10 THEN 'OVERDUE'
ELSE 'ONTIME'
END AS STATUS
FROM Orders
JOIN Customers ON Customers.CustomerID= Orders.CustomerID
WHERE City = 'Paris'