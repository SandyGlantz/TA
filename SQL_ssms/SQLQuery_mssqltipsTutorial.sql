/***************************************************		
	dB-SQL Item 26 Tutorial and assignment:
	Design a Stored Procedure that has two joins
	and a parameter:
	  
****************************************************/



--	Idea is to create an email list for HR, that   
--	they can query for hours of unused vacation time
--	and remind those employees to Use or Lose their vacation;
--	or to allow HR to query by employee last name (letter)
--	to reply to an inquiring employee.

USE AdventureWorks2014

--Note:	Instructor said not to use GO like in the tutorial
--		Using BEGIN/END gave me errors
--		Not using either worked - so I went with it.

CREATE PROC GetVacationTime
@LastName nvarchar(30)
AS

	SELECT 
		e.VacationHours AS 'Vacation Hrs to use',
		p.FirstName AS 'First Name',
		p.LastName AS  'LastName',
		m.EmailAddress AS 'Email',
		e.JobTitle AS 'Title'

	FROM 
		HumanResources.Employee AS e
		INNER JOIN Person.Person AS p
			ON e.BusinessEntityID = p.BusinessEntityID

		INNER JOIN Person.EmailAddress AS m
			ON e.BusinessEntityID = m.BusinessEntityID

	WHERE p.LastName LIKE @LastName + '%'

ORDER BY e.VacationHours DESC




--	execution test:

USE AdventureWorks2014

EXEC GetVacationTime @LastName = ''
--works, shows most hours on top
EXEC GetVacationTime @LastName = 'J'
--works, shows just those with as j in the last name




/***************************************************		
	Stored proceedure drills from MSSQL tips:
 https://www.mssqltips.com/sqlservertutorial/161/creating-a-simple-stored-procedure/  
****************************************************/



/***************************************************		
	Seleting all data from the Person.Address table:  
****************************************************/

USE AdventureWorks2014;  --sg added this line - not in tutorial
SELECT * FROM Person.Address;




/***************************************************		
	Create a stored procedure to do the same thing:  
****************************************************/

USE AdventureWorks2014;
GO

	
CREATE PROCEDURE  dbo.uspGetAddress  --(can also be CREATE PROC)
AS
SELECT * FROM Person.Address
GO



/***************************************************		
	sg trying a different saved PROC of the same thing:  
****************************************************/

USE AdventureWorks2014;
GO
	
CREATE PROC  GetAddress
AS
SELECT * FROM Person.Address
GO
--output says Comand(s) completed sucessfully; so dbo used why??




/***************************************************		
	Different ways to call the stored procedure:
	Did not use GO or show db source first ... 
	best practice to include??  
****************************************************/

EXEC GetAddress;  -- tried with and w/o semi-colon; both worked.
EXEC dbo.GetAddress  -- works, w and w/o ;
GetAddress; -- also works w and w/o ;




/***************************************************		
	Tutorial says GO after db call won't work in a 
	Saved Procedure - but this worked:
****************************************************/
USE AdventureWorks2014;
GO

EXEC GetAddress;





/***************************************************		
	Single Parameter created procedure

	NOTE: Tutorial had errors!!! - FIXED below
	1. USE AdventureWorks s/be: USEAdventureWorks2014
	2. The Procedure name has already been created: 
		CREATE PROCEDURE dbo.uspGetAddress @City nvarchar(30)
		Changed to GetCityAddress.
		
****************************************************/

USE AdventureWorks2014
GO

CREATE PROCEDURE GetAddressByCity 
	@City nvarchar(30)
		AS
		SELECT * 
			FROM Person.Address
			WHERE City = @City
GO


--	execution test:
EXEC GetAddressByCity @city = 'New York'
--  works
EXEC dbo.GetAddressByCity @city = 'New York'
--	also works





/***************************************************		
	Adding wildcards to parameters

	NOTE: Tutorial uses an existing saved procedure
	1. USE AdventureWorks s/be: USEAdventureWorks2014
	2. The Procedure name has already been created: 
		CREATE PROCEDURE dbo.uspGetAddress @City nvarchar(30)
		Changed to GetCityAddressWC.
		
****************************************************/
USE AdventureWorks2014
GO

CREATE PROCEDURE GetCityAddressWC 
	@City nvarchar(30) 
		AS 
		SELECT * 
			FROM Person.Address 
			WHERE City LIKE @City + '%' 
GO


--	execution test:
EXEC GetCityAddressWC @city = 'New'
--	works; included Newport, Newcastle, etc.

EXEC GetCityAddressWC @city = ''
--	also works; shows everything





/***************************************************		
	NULL option for Parameter Value

	NOTE: Tutorial uses an existing saved procedure
	1. USE AdventureWorks s/be: USEAdventureWorks2014
	2. The Procedure name has already been created: 
		CREATE PROCEDURE dbo.uspGetAddress @City nvarchar(30)
		Changed to GetCityAddressISnull.
		
****************************************************/

USE AdventureWorks2014
GO

CREATE PROCEDURE GetCityAddressISnull 
	@City nvarchar(30) = NULL
		AS
		SELECT *
			FROM Person.Address
			WHERE City = ISNULL(@City,City)
GO


--	execution test:
EXEC GetCityAddressISnull @city = NULL
--	returns all records because no value given	

--	BUT this returns zero records???:
	EXEC GetCityAddressISnull @city = ''





/***************************************************		
	Multiple Parameter Saved Procedure

	NOTE: Tutorial uses an existing saved procedure
	1. USE AdventureWorks s/be: USEAdventureWorks2014
	2. The Procedure name has already been created: 
		CREATE PROCEDURE dbo.uspGetAddress @City nvarchar(30)
		Changed to GetAddressMulti.
		
****************************************************/

USE AdventureWorks2014
GO

CREATE PROCEDURE GetAddressMulti 
	@City nvarchar(30) = NULL, @AddressLine1 nvarchar(60) = NULL
		AS
		SELECT *
			FROM Person.Address
			WHERE City = ISNULL(@City,City)
				AND AddressLine1 LIKE '%' + ISNULL(@AddressLine1 ,AddressLine1) + '%'
GO


--	execution test:
GetAddressMulti @AddressLine1 = 'New'
--	works

EXEC GetAddressMulti @City = ''
--	returns no records

GetAddressMulti @AddressLine1 = NULL	
--  works, gives all records; underlines in red without EXEC at beginning

EXEC GetAddressMulti @City = 'Portland', @AddressLine1 = 'g'
EXEC GetAddressMulti @City = NULL, @AddressLine1 = 'Washington'
--	both work; noted that city needs a name (or NULL), but address can be partial
EXEC GetAddressMulti @City = 'P', @AddressLine1 = 'a'
--	this returns zero records






/***************************************************		
	OUTPUT Parameter Saved Procedure

	NOTE:  error in FROM - should be AdventurrWorks2014
	Changed SP name, added 2014 at end

	Discovered this when running the execution and getting an error
	No error when creating the SP.

****************************************************/

CREATE PROCEDURE dbo.uspGetAddressCount2014 
	@City nvarchar(30), @AddressCount int OUTPUT --OUT = OUTPUT
		AS
		SELECT @AddressCount = count(*) 
			FROM AdventureWorks2014.Person.Address 
			WHERE City = @City


--	execution:
DECLARE @AddressCount int
EXEC dbo.uspGetAddressCount2014 
	@City = 'Calgary', @AddressCount = @AddressCount OUTPUT
		SELECT @AddressCount
--	works once the 2014 part is fixed  :-/

--	alternate execution:
DECLARE @AddressCount int
EXEC dbo.uspGetAddressCount2014 
	'Portland', @AddressCount OUTPUT
		SELECT @AddressCount
--	works ... NULL in the city = 0




/***************************************************		
	SG note on Saved Procedures:
	AdventureWorks came with some,
	and the current tutorial also
	included "usp" at the beginning of the names...
	Guessing that stood for "user saved procedure"?
	Can't use "sp_" in front because it's a server command.
	I like using "Get" in front because it indicates
	the action to a user.
	Not sure why they didn't just use spGetAddress
	instead of uspGetAddress ...
		
****************************************************/









