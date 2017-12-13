
USE db_zoo2
GO

/*
  CONVERT9varchar(50),@totalHab)
  This converts the data type from MONEY to String Characters
  char(9) = Line Break
  char(13) = Tab Key
*/

-- States the variable and the data type of the variable
DECLARE @totalHab MONEY;
DECLARE @totalNut MONEY;
DECLARE @results MONEY;

--setting the variable with a value from a table
-- SUM totals all the values from the column
SET @totalHab = (SELECT SUM(habitat_cost) FROM tbl_habitat);
SET @totalNut = (SELECT SUM(nutrition_cost) FROM tbl_nutrition);
SET @results = (@totalHab + @totalNut)

PRINT (
	CONVERT(varchar(50),@totalHab) + char(9) + 
	' - The Total Habitat Cost' + char(13) +

	CONVERT(varchar(50),@totalNut) + char(9) +char(9) + 
	' - The Total Nutrition Cost ' + char(13) +
	 '----------' + char(13) +

	CONVERT(varchar(50),@results)
);