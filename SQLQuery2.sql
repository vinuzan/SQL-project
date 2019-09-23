SELECT TOP 5 Customers.CustomerID, Customers.ContactName, Customers.City, Orders.OrderID, [Order Details].OrderID, [Order Details].Quantity FROM Customers
--All 3 tables have been joined
JOIN Orders ON Orders.CustomerID = Customers.CustomerID
JOIN [Order Details] ON [Order Details].OrderID = Orders.OrderID
WHERE City = 'Paris'
ORDER BY [Order Details].Quantity DESC