SELECT
	FirstName AS First_Name
	,LastName AS Last_Name
FROM Sales.Customers

UNION

SELECT
	FirstName
	,LastName
FROM sales.Employees



---- Combining Cutsomer and employee data

SELECT 
	'Customer Data' AS Dataset
	,CustomerID AS Id
	,FirstName
	,LastName
	,Country
	,Score
	,NULL AS Department
	,NULL AS Birthdate
	,NULL AS Gender
	,NULL AS Salary
	,NULL AS ManagaerID
FROM Sales.Customers

UNION ALL

SELECT 
	'Employee Data' AS Dataset
	,EmployeeID
	,FirstName
	,LastName
	,NULL AS Country
	,NULL AS Score
	,Department
	,BirthDate
	,Gender
	,Salary
	,ManagerID
FROM Sales.Employees