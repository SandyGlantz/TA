
USE db_zoo2
GO


DECLARE @animalName varchar(50)
DECLARE @errorString varchar(100)
DECLARE @results varchar(5)

SET @animalName = 'monkies'
SET @errorString = 
		'Please check your spelling. No '+@animalName+ ' found.'

BEGIN TRY
	SET @results = (SELECT COUNT(tbl_species.species_name)
		FROM tbl_species 
		WHERE species_name = @animalName)

		IF @results = 0
			BEGIN
				--logic if this condition is true:
				RAISERROR(@errorString, 16, 1)
				RETURN
			END

		ELSE IF @results = 1
			BEGIN

		SELECT
			a1.species_name, 
			a2.animalia_type, 
			a3.class_type, 
			a4.order_type, 
			a5.habitat_type, 
			a6.nutrition_type, 
			a7.care_type

		FROM tbl_species a1 
			INNER JOIN tbl_animalia a2 
				ON a2.animalia_id = a1.species_animalia
			INNER JOIN tbl_class a3 
				ON a3.class_id = a1.species_class
			INNER JOIN tbl_order a4 
				ON a4.order_id = a1.species_order
			INNER JOIN tbl_habitat a5 
				ON a5.habitat_id = a1.species_habitat
			INNER JOIN tbl_nutrition a6 
				ON a6.nutrition_id = a1.species_nutrition
			INNER JOIN tbl_care a7 
				ON a7.care_id = a1.species_care
	
		WHERE a1.species_name = @animalName
		;
	END
END TRY

BEGIN CATCH
	--some logic if errors ocur:
	SELECT @errorString = ERROR_MESSAGE()
	RAISERROR (@errorString, 10, 1)
END CATCH

