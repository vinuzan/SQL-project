--SELECT CompanyName, AVG(UnitsOnOrder) FROM Products P
--JOIN Suppliers S ON P.SupplierID = S.SupplierID
--Group BY CompanyName
--HAVING AVG(UnitsOnOrder) != 0
--Order By AVG(UnitsOnOrder) DESC

/*SELECT E.FirstName+ ' ' +E.LastName AS 'Employee Name', OrderID, OrderDate, O.OrderDate, O.Freight  FROM Orders O
JOIN Customers C ON O.CustomerID = C.CustomerID
JOIN Employees E ON O.EmployeeID = E.EmployeeID
ORDER BY Freight*/
Use Northwind
SELECT OrderID, ProductID, UnitPrice, Quantity, Discount
FROM [Order Details]
WHERE [ProductID] NOT IN 
(SELECT ProductID FROM Products WHERE Discontinued = 1)

Use north
SELECT Phone FROM Customers
UNION ALL
SELECT HomePhone FROM Employees
UNION ALL