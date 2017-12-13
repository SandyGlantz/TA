USE AdventureWorks2014

CREATE PROCEDURE storedProcedureDrill 
@territory int, @salesID int

AS
BEGIN
	SELECT DISTINCT(Sales.Store.Name), 
	Sales.SalesTerritory.Name, 
	Person.Person.FirstName, 
	Person.Person.LastName

		FROM Sales.SalesOrderHeader

		INNER JOIN Sales.SalesTerritory 
			ON Sales.SalesTerritory.TerritoryID = Sales.SalesOrderHeader.TerritoryID
		INNER JOIN Sales.SalesPerson 
			ON Sales.SalesPerson.TerritoryID = Sales.SalesOrderHeader.TerritoryID
		INNER JOIN Sales.Store 
			ON Sales.Store.SalesPersonID = Sales.SalesOrderHeader.SalesPersonID
		INNER JOIN Person.Person ON Person.BusinessEntityID = Sales.SalesPerson.BusinessEntityID
	
	WHERE Sales.SalesTerritory.TerritoryID = @territory 
		AND Sales.SalesOrderHeader.SalesPersonID = @salesID

	ORDER BY Sales.Store.Name;


END

--	execution test:
EXEC storedProcedureDrill  @territory=3, @salesID=275
