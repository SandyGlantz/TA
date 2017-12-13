
/*****************************************************
	dB/SQL, Item 19 -- Drill 1
	All information from the habitat table.
******************************************************/

USE db_zoo;

SELECT * FROM tbl_habitat;




/*****************************************************
	dB/SQL, Item 19 -- Drill 2
	Retrieve all names from the species_name column 
	that have a species_order value of 3.
******************************************************/

USE db_zoo;

SELECT species_name
FROM tbl_species WHERE species_order = 3;




/*****************************************************
	dB/SQL, Item 19 -- Drill 3
	Retrieve only the nutrition_type from the nutrition table 
	that have a nutrition_cost of 600.00 or less.
******************************************************/

USE db_zoo;

SELECT nutrition_type
FROM tbl_nutrition WHERE nutrition_cost <=600;




/*****************************************************
	dB/SQL, Item 19 -- Drill 4
	Retrieve all species_names with the nutrition_id 
	between 2202 and 2206 from the nutrition table.
******************************************************/

USE db_zoo;

SELECT	a1.species_name, a6.nutrition_id
	FROM tbl_species a1
		INNER JOIN tbl_nutrition a6 
			ON a6.nutrition_id = a1.species_nutrition
WHERE nutrition_id BETWEEN 2202 AND 2206;




/*****************************************************
	dB/SQL, Item 19 -- Drill 5
	Retrieve all names within the species_name column 
	using the alias "Species Name:" from the species table 
	and their corresponding nutrition_type under the alias 
	"Nutrition Type:" from the nutrition table.
******************************************************/

USE db_zoo;

SELECT	a1.species_name AS 'Species Name', 
		a6.nutrition_type AS 'Nutrition Type'
	FROM tbl_species a1
		INNER JOIN tbl_nutrition a6 
			ON a6.nutrition_id = a1.species_nutrition;





/*****************************************************
	dB/SQL, Item 19 -- Drill 6
	From the specialist table, retrieve the first and 
	last name and contact number of those that provide 
	care for the penguins from the species table.
******************************************************/

USE db_zoo;

SELECT	a8.specialist_fname AS 'First name', 
		a8.specialist_lname AS 'Last name',
		a8.specialist_contact AS 'Phone Number'
 				
FROM 	tbl_specialist a8
		INNER JOIN tbl_care a7 
		ON a7.care_specialist = a8.specialist_id
		
		INNER JOIN tbl_species a1 
		ON a7.care_id = a1.species_care

WHERE a1.species_name = 'penguin';




/*****************************************************
	dB/SQL, Item 19 -- Drill 7
	Create a database with two tables. Assign a foreign key 
	constraint on one table that shares related data with the 
	primary key on the second table. Finally, create a 
	statement that queries data from both tables.


	Overview:
	Student List in one table
	Attendance by week in another table
	Query for those students with absences in a week.

	****NOTE: 
	1. Would use the DATE function/format if this were IRL.
	2. IRL, also would have a third table with different values for
		attendance 0=absent, 1=present, 2=late, 3=holiday, etc.

******************************************************/

USE [master]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE DATABASE db_attendance;


USE db_attendance;
/*****************************************************
			created tables
******************************************************/

CREATE TABLE tbl_student (
		student_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		student_fname VARCHAR(50) NOT NULL,
		student_lname VARCHAR(50) NOT NULL
	);

CREATE TABLE tbl_week1 (
		week1_id INT PRIMARY KEY NOT NULL IDENTITY(52,1),
		week1_begins VARCHAR(50) NOT NULL,
		week1_student INT NOT NULL 
			CONSTRAINT fk_student_id
			FOREIGN KEY REFERENCES tbl_student(student_id)
			ON UPDATE CASCADE ON DELETE CASCADE,
		week1_mon INT NOT NULL,
		week1_tue INT NOT NULL,
		week1_wed INT NOT NULL,
		week1_thu INT NOT NULL,
		week1_fri INT NOT NULL
	);


/*****************************************************
			populated tables
******************************************************/

INSERT INTO tbl_student
	(student_fname,student_lname)
	VALUES
	('Bill', 'Gates'),
	('Jon', 'Stewart'),
	('Elon', 'Musk'),
	('Oprah', 'Winfrey'),
	('Michelle', 'Obama')

SELECT * FROM tbl_student;


INSERT INTO tbl_week1
	(week1_begins, week1_student, 
	week1_mon, week1_tue, week1_wed, week1_thu, week1_fri)
	VALUES
	('2017-07-31', 1, 1, 1, 1, 1, 1),
	('2017-07-31', 2, 1, 1, 1, 1, 0),
	('2017-07-31', 3, 0, 1, 1, 1, 0),
	('2017-07-31', 4, 1, 1, 1, 1, 1),
	('2017-07-31', 5, 1, 1, 1, 1, 1)

SELECT * FROM tbl_week1;



/*****************************************************
			query for those with absences
******************************************************/


SELECT	b1.student_fname AS 'Student Name', 
		b1.student_lname AS 'Student Last Name',
		b2.week1_mon AS 'Monday 7/31',
		b2.week1_tue AS 'Tuesday 8/1',
		b2.week1_wed AS 'Wednesday 8/2',
		b2.week1_thu AS 'Thursday 8/3',
		b2.week1_fri AS 'Friday 8/4'

	FROM tbl_student b1
		INNER JOIN tbl_week1 b2 
			ON b1.student_id = b2.week1_student

	WHERE 
		b2.week1_mon + 
		b2.week1_tue +
		b2.week1_wed +
		b2.week1_thu +
		b2.week1_fri < 5
;
