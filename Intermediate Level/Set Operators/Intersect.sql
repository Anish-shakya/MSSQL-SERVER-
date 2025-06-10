---- EXCEPT Operator ------


SELECT
	FirstName AS First_Name
	,LastName AS Last_Name
FROM Sales.Employees

INTERSECT

SELECT
	FirstName
	,LastName
FROM sales.Customers


