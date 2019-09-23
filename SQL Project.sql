USE Northwind

-----EXERCISE 1 - NORTHWIND QUERIES-----

--1.1 List of customers in either Paris or London
SELECT CustomerID, CompanyName, Address, City, Region, PostalCode, Country FROM Customers
WHERE City = 'Paris' OR City = 'London'

--1.2 List of all products stored in bottles
SELECT ProductName, QuantityPerUnit AS 'Quantity & Volume of Bottle' FROM Products
WHERE QuantityPerUnit LIKE '%bottle%'

--1.3 Repeat of above with supplier name and country
SELECT P.ProductName, S.CompanyName, S.Country, P.QuantityPerUnit AS 'Quantity & Volume of Bottle' FROM Products P
JOIN Suppliers S ON S.SupplierID = P.SupplierID
WHERE P.QuantityPerUnit LIKE '%bottle%'

--1.4 Number of products in each cateogry with highest number first
SELECT COUNT(P.ProductName) AS 'No. of Products', (c.CategoryName) FROM Products P
JOIN Categories C ON C.CategoryID = P.CategoryID
GROUP BY c.CategoryName
ORDER BY 'No. of Products' DESC

--1.5 All UK Employees with their names concatenated and their city of residence
SELECT TitleOfCourtesy + FirstName + LastName AS 'Full Name', City FROM Employees
WHERE Country = 'UK'

--1.6 List of Sales Total for all Regions with a Sales total greater than 1,000,000
/*SELECT * FROM Region R
JOIN Territories T ON T.RegionID = R.RegionID
SELECT OrderID, ((UnitPrice * Quantity) * (1- Discount)) AS 'Sales' FROM [Order Details]*/


--1.7 Number of orders with a Freight over 100.00 and either USA or UK as ship country
SELECT COUNT(Freight) AS 'No. of Orders with Frieght Greater than 100.00', ShipCountry FROM Orders
WHERE Freight > '100.00' AND ShipCountry = 'UK' or ShipCountry = 'USA'
GROUP BY ShipCountry

--1.8 Order ID of the Order with the biggest disocunt applied
SELECT OrderID,
	(SELECT MAX(Discount) AS 'Dicount' FROM [Order Details]) FROM [Order Details]
ORDER BY OrderID

SELECT TOP 1 orderID, ((UnitPrice * Quantity) - ((UnitPrice * Quantity) * (1 - Discount))) AS 'Discount Amount' FROM [Order Details]
ORDER BY 'Discount Amount' DESC

	/*The first query finds the order ID with the highest discount applied whereas the second query calculates the amount of discount 
	 (discount value relative to the total price) and ordered in the descending order (largest discount displayed first) and limited
	 to show only one result.*/



-----EXERCISE 2 - CREATE DATABSE SCHEMA-----

--2.1 A set of fully normalised tables to store the provided information

	--Table 1: Course details
	CREATE TABLE course_name (
		course_id INT NOT NULL PRIMARY KEY,
		course_name VARCHAR(50)
	);

	INSERT INTO course_name
	VALUES	(1, 'BA-TEST'),
			(2, 'Engineer')

	--Table 2: Course Trainer
	CREATE TABLE course_trainer (
		trainer_id INT NOT NULL PRIMARY KEY,
		trainer_name VARCHAR(50)
	);

	INSERT INTO course_trainer
	VALUES	(1, 'Tim Cawte'),
			(2, 'Richard Gurney')


	--Table 3: Course Spartan
	CREATE TABLE course_spartan (
		spartan_id INT NOT NULL PRIMARY KEY,
		spartan_name VARCHAR(50)
	);

	INSERT INTO course_spartan
	VALUES	(1, 'Adam Smith'),
			(2, 'John Williams'),
			(3, 'Nick Willis'),
			(4, 'Jenny Jones'),
			(5, 'Katie Prince'),
			(6, 'Peter Brown'),
			(7, 'Mo Khan'),
			(8, 'Juan Carlos'),
			(9, 'Jan Miller'),
			(10, 'Kyle Carpenter'),
			(11, 'Alvarao Carlos'),
			(12, 'Margaret Baker'),
			(13, 'Oti Mwase')


	--Table 4: Course Academy Name
	CREATE TABLE course_academy (
		academy_id INT NOT NULL PRIMARY KEY,
		academy_name VARCHAR(50)
	);

	INSERT INTO course_academy
	VALUES	(1, 'Richmond')


		--Table 5: Course Room Number
	CREATE TABLE course_room (
		room_id INT NOT NULL PRIMARY KEY,
		room_number VARCHAR(50)
	);

	INSERT INTO course_room
	VALUES	(1, 'Room1'),
			(3, 'Room3')


	--Table 6: Course Start Date
	CREATE TABLE course_startdate (
		start_date DATE NOT NULL PRIMARY KEY,
	);

	INSERT INTO course_startdate
	VALUES	('2018/01/15'),
			('2018/01/22')


	--Table 7: Course End Date
	CREATE TABLE course_enddate (
		end_date DATE NOT NULL PRIMARY KEY,
	);

	INSERT INTO course_enddate
	VALUES	('2018/03/02'),
			('2018/03/03')

--I did not manage to complete Exerciese 2, hence the following are just commands which I would have used if i did manage to complete Exercise 2.

--3.1 Produce a similar report to 2.1 from all 7 tables using one SQL statement. 
SELECT * FROM <Table1...Table7>
JOIN <Table1...Table7> ON <Table1...Table7><Column_courseID> = <Table1...Table7><column_courseID> -- CourseID is my primary key. I would have repeated 7 joins to merge all tables
DATE_FORMAT('2018-01-15', 'dd/mm/YYYY') -- Formatting date for the start and end date tables.

--3.2 Repeat the above but replace spartan name with spartan initials
ALTER TABLE <table_name>
DROP COLUMN <spartan_name>					--Dele the sparta names column

ALTER TABLE <table_name>					--Create new column for spartan initials
ADD <spartan_initials VARCHAR(5)>
INSERT INTO <table_name> (spartan_initials) -- Add spartan initials into column
VALUES ('A.S', '...')

--3.3 Add a new column after end date headed 'Checkdate'
SELECT *,																
CASE WHEN course_name = 'BA Test' THEN DATEADD(dd, 56, '2018-01-15')	--Add 8 weeks if course name = BA TEST
ELSE DATEADD(dd, 84, '2018-01-15')										--Else add 12 weeks
END AS 'Checkdate'														--Return as 'checkdate' column
FROM <table_name>