USE db_zoo;

CREATE TABLE tbl_animalia  (
	animalia_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	animalia_type VARCHAR(50) NOT NULL
);

INSERT INTO tbl_animalia
	(animalia_type)
		VALUES  ('vertebrate'), ('invertebrate')
;

CREATE TABLE tbl_class  (
	class_id INT PRIMARY KEY NOT NULL IDENTITY (100,1),
	class_type VARCHAR(50) NOT NULL
);

INSERT INTO tbl_class
	(class_type)
		VALUES	('bird'), ('reptilian'), ('mammal'), ('anthropod'), 
				('fish'), ('worm'), ('cnidaria'), ('echinoderm')
;




CREATE TABLE tbl_order  (
	order_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	order_type VARCHAR(50) NOT NULL
);


CREATE TABLE tbl_care  (
	care_id INT PRIMARY KEY NOT NULL,
	care_type VARCHAR(50) NOT NULL,
	care_specialist INT NOT NULL
);


CREATE TABLE tbl_nutrition  (
	nutrition_id INT PRIMARY KEY NOT NULL IDENTITY (2200,1),
	nutrition_type VARCHAR(50) NOT NULL,
	nutrition_cost MONEY NOT NULL
);


CREATE TABLE tbl_habitat  (
	habitat_id INT PRIMARY KEY NOT NULL IDENTITY (5000,1),
	habitat_type VARCHAR(50) NOT NULL,
	habitat_cost MONEY NOT NULL
);


CREATE TABLE tbl_specialist  (
	specialist_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	specialist_fname VARCHAR(50) NOT NULL,
	specialist_lname VARCHAR(50) NOT NULL,
	specialist_contact VARCHAR(50) NOT NULL
);


DROP DATABASE db_zoo;



				


