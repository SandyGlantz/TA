USE db_zoo2

CREATE PROC getANIMAL_INFO
@animalName varchar(50)
AS
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


/*
In the video he keeps opening new query windows,
I'm trying just moving down the page ...
(especially since there's an "END" above)
*/


USE db_zoo2


EXEC
[dbo].[getANIMAL_INFO] 'monkey'


