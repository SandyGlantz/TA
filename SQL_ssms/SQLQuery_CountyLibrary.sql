

CREATE DATABASE db_CountyLibrary;


USE db_CountyLibrary;




-- ===== Remove table, some with order needed =====

DROP TABLE tbl_author;
DROP TABLE tbl_loans;
DROP TABLE tbl_copies;

--  Below must be dropped in exact order (top to bottom)

DROP TABLE tbl_borrower;
DROP TABLE tbl_branch;
DROP TABLE tbl_book;
DROP TABLE tbl_publisher;
-- =====




/*****************************************************
			created tables
******************************************************/



CREATE TABLE tbl_publisher (

		publisher_name VARCHAR(100) PRIMARY KEY NOT NULL,
		publisher_address VARCHAR(150) NOT NULL, 
		publisher_phone VARCHAR(50) NOT NULL

	);


CREATE TABLE tbl_book (
		book_id INT PRIMARY KEY NOT NULL,
		book_title VARCHAR(200) NOT NULL,
		book_Publisher VARCHAR(100)FOREIGN KEY REFERENCES tbl_publisher(publisher_name) NOT NULL, 
	);


CREATE TABLE tbl_branch (

		branch_id  INT PRIMARY KEY NOT NULL IDENTITY(101,1),	
		branch_name  VARCHAR(50) NOT NULL, 
		branch_address  VARCHAR(100) NOT NULL
	);

	
CREATE TABLE tbl_borrower (

		borrower_id  INT PRIMARY KEY NOT NULL IDENTITY(1001,1),	
		borrower_name  VARCHAR(50) NOT NULL, 
		borrower_address  VARCHAR(100) NOT NULL,
		borrower_phone  VARCHAR(50)  NOT NULL
	);


CREATE TABLE tbl_copies (

		copies_bookID INT FOREIGN KEY REFERENCES tbl_book(book_id) NOT NULL, 
		copies_branchID INT FOREIGN KEY REFERENCES tbl_branch(branch_id) NOT NULL, 
		copies_numberOf INT NOT NULL
	);

/*****************************************************
This returned errors:
		copies_bookID INT FOREIGN KEY REFERENCES tbl_book(book_id) NOT NULL 
			ON UPDATE CASCADE ON DELETE CASCADE,
		copies_branchID INT FOREIGN KEY REFERENCES tbl_branch(branch_id) NOT NULL 
			ON UPDATE CASCADE ON DELETE CASCADE,
		copies_numberOf INT NOT NULL


But this worked fine in another dB I created last week:
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

	WHAT AM I MISSING????
******************************************************/


CREATE TABLE tbl_loans (

		loans_bookID INT FOREIGN KEY REFERENCES tbl_book(book_id) NOT NULL, 
		loans_branchID INT FOREIGN KEY REFERENCES tbl_branch(branch_id) NOT NULL, 
		loans_borrowerID INT FOREIGN KEY REFERENCES tbl_borrower(borrower_id) NOT NULL, 
		loans_dateOut DATE NOT NULL,
		loans_dueDate DATE NOT NULL
	);


CREATE TABLE tbl_author (

		author_bookID INT FOREIGN KEY REFERENCES tbl_book(book_id) NOT NULL,  
		author_name VARCHAR(100) NOT NULL
	);





/*****************************************************
			populated tables
******************************************************/





INSERT INTO tbl_publisher
	(publisher_name, publisher_address, publisher_phone)
	VALUES
	
	('Bloomsbury USA', '1385 Broadway, 5th Floor New York, NY 10018', '212-419-5300'),
	('HarperCollins Publishers','195 Broadway New York, NY 10007', '212-207-7000'),
	('Penguin Random House', '1745 Broadway, New York, NY, 10019', '212-782-9000'),
	('Farrar, Straus and Giroux Publishers', '19 Union Square West, New York, NY, 10003', '212-741-6900'),
	('Macmillan Trade Group', '175 Fifth Avenue, New York, NY 10010', '646-307-5421'),
	('Scholastic Books', '557 Broadway New York NY 10012 USA', '212-343-6100'),
	('W. W. Norton and Company', '500 Fifth Avenue, New York, New York 10110', '212-354-5500'),
	('Perseus Books Group', '11 Cambridge Center, Cambridge, MA, 02142', '212-340-8100'),
	('Wiley', '111 River Street Hoboken, NJ 07030-5774','201-748-6000'),
	('Simon & Schuster Books', '1230 Avenue of the Americas, 10th F, New York, NY, 10020', '212-698-7086'),
	('Beyond Words Publishing', '20827 NW Cornell Rd Ste 500, Hillsboro, OR 97124', '503-531-8700'),
	('St. Martin''s Press', '175 Fifth Ave., New York, NY, 10010', '800-221-7945'),
	('Abrams Books', '100 Fifth Avenue, New York, NY, 10011', '212-206-7715'),
	('Sterling Publishing', '1166 Avenue of the Americas, New York, New York, 10036', '800-367-9692'),
	('Hay House Publishing', 'PO Box 990. Witkoppen 2068, India', '800-654-5126'),
	('Hyperion Books', '237 Park Avenue, New York, NY 10017', '212-364-1100'),
	('Houghton Mifflin Harcourt', '181 Ballardvale Street, Wilmington, MA, 01887', '800-225-1464 ext 1462'),
	('Sasquatch Books', '119 South Main , Seattle WA 98104', '800-775-0817'),
	('Storey Publishing', '210 Mass MoCA Way North Adams, MA 01247', '413-346-2100'),
	('Prometheus Books', '59 John Glenn Drive, Amherst, NY, 14228', '800-421-0351'),
	('Trinity University Press', 'One Trinity Place, San Antonio, Texas 78212', '210-999-8884'),
	('Greystone Books', '343 Railway Street, Suite 201 Vancouver, BC Canada V6A 1A4', '604-875-1550'),
	('BenBella Books', '10300 N Central Expy # 400, Dallas, TX 75231', '214-361-7901'),
	('Cook''s Illustrated', '17 Station Street, Brookline, MA 02445', '617-232-1000')

SELECT * FROM tbl_publisher;



INSERT INTO tbl_book
	(book_id, book_title, book_Publisher)
	VALUES
	
	(0330336193, 'The Lost Tribe', 'Macmillan Trade Group'),  --place at least two in every branch,  place 3 in Sharptown
	(1451663838, '11/22/63: A Novel','Simon & Schuster Books'), --place at least two copies in central


	(0007790163, 'Longitude: The True Story of a Lone Genius Who Solved the Greatest Scientific Problem of His Time', 'Bloomsbury USA'),
	(0060548258, 'The Crystal Cave (The Arthurian Saga, Book 1)', 'HarperCollins Publishers'),
	(0060850523, 'Brave New World', 'Penguin Random House'),		--Sharptown	101
	(0060894083, 'Genome: The Autobiography of a Species in 23 Chapters', 'HarperCollins Publishers'),
	(0062316095, 'Sapiens: A Brief History of Humankind', 'HarperCollins Publishers'),
	(0062368591, 'I Contain Multitudes: The Microbes Within Us and a Grander View of Life', 'HarperCollins Publishers'),
	(0143038580, 'The Omnivore''s Dilemma', 'Penguin Random House'),
	(0143117009, 'Collapse: How Societies Choose to Fail or Succeed', 'Penguin Random House'),
	(0307279464,  'A Walk in the Woods: Rediscovering America on the Appalachian Trail', 'Penguin Random House'),
	(0307588696, 'Kingpin: How One Hacker Took Over the Billion-Dollar Cybercrime Underground', 'Penguin Random House'),
	(1933615982, 'The Science of Good Cooking', 'Cook''s Illustrated'),

	
	(0312367546, 'A Wrinkle in Time', 'Farrar, Straus and Giroux Publishers'),		--Central 102
	(0312421877, 'Imagining Numbers', 'Macmillan Trade Group'),
	(0345391802,  'The Hitchhiker''s Guide to the Galaxy', 'Penguin Random House'),
	(0345413350, 'The Golden Compass (His Dark Materials 1)', 'Scholastic Books'),
	(0374512973, 'Oranges', 'Farrar, Straus and Giroux Publishers'),
	(0375760393, 'The Botany of Desire: A Plant''s-Eye View of the World', 'Penguin Random House'),
	(0375822747, 'The City of Ember', 'Penguin Random House'),
	(0375826696,  'Eragon (Inheritance)', 'Penguin Random House'),
	(0393317552,  'Guns, Germs, and Steel',  'W. W. Norton and Company'),
	(0393323145, 'The Seven Daughters of Eve: The Science That Reveals Your Genetic Ancestry', 'W. W. Norton and Company'),

	
	(0440414806, 'Holes', 'Farrar, Straus and Giroux Publishers'),		--Oceanside 103
	(0441172717, 'Dune', 'HarperCollins Publishers'),
	(0465074871, 'Rest: Why You Get More Done When You Work Less',  'Perseus Books Group'),
	(0470586958, 'The Intelligence Paradox: Why the Intelligent Choice Isn''t Always the Smart One',  'Wiley'),
	(0517542021, 'The Clan of the Cave Bear', 'Penguin Random House'),
	(0553380648, 'The Electric Kool-Aid Acid Test', 'Macmillan Trade Group'),
	(0553384481, 'Mindless Eating: Why We Eat More Than We Think', 'Penguin Random House'),
	(0553447432, 'Evicted: Poverty and Profit in the American City', 'Penguin Random House'),
	(0590353403, 'Harry Potter and the Sorcerer''s Stone', 'Scholastic Books'),
	(0689852231, 'The House of the Scorpion', 'Simon & Schuster Books'),
	(416936475, 'Hatchet', 'Simon & Schuster Books'),

	
	(0743250621, 'The Know-It-All: One Man''s Humble Quest to Become the Smartest Person in the World', 'Simon & Schuster Books'),
	(0743289803, 'The Hidden Messages in Water', 'Beyond Words Publishing'),		--Riverview 104
	(0743437314, 'The Merchant of Death (Pendragon)', 'Simon & Schuster Books'),
	(0765317737, 'The White Plague', 'St. Martin''s Press'),
	(0805092994, 'The Sixth Extinction: An Unnatural History', 'Bloomsbury USA'),
	(0810989212, 'Understand Rap: Explanations of Confusing Rap Lyrics You and Your Grandma Can Understand', 'Abrams Books'),
	(1328869334, '1984', 'Sterling Publishing'),
	(1401945074, 'Power vs. Force', 'Hay House Publishing'),
	(1401302750, 'How to Walk in High Heels: The Girl''s Guide to Everything', 'Hyperion Books'),
	(1430364910, 'The Great Influenza: The Story of the Deadliest Pandemic in History', 'Penguin Random House'),
	(400032059, '1491: New Revelations of the Americas Before Columbus', 'Penguin Random House'),

	
	(1451648537, 'Steve Jobs', 'Simon & Schuster Books'),				--Parkdale 105
	(1476733503, 'The Gene: An Intimate History', 'Penguin Random House'),
	(1494812509, 'Walden', 'Houghton Mifflin Harcourt'),
	(1570610444, 'Slug Tossing: Adventures of a Reluctant Gardener', 'Sasquatch Books'),
	(1580170277, 'Carrots Love Tomatoes: Secrets of Companion Planting for Successful Gardening', 'Storey Publishing'),
	(1591024757, 'The Fabulous Fibonacci Numbers', 'Prometheus Books'),
	(1595348050, 'Tides: The Science and Spirit of the Ocean', 'Trinity University Press'),
	(1608196100, 'The Grid: The Fraying Wires Between Americans and Our Energy Future', 'Bloomsbury USA'),
	(1771642483, 'The Hidden Life of Trees: What They Feel, How They Communicate',  'Greystone Books'),
	(1932100660, 'The China Study: The Most Comprehensive Study of Nutrition Ever Conducted', 'BenBella Books'),
	(1936276011, 'The Art Of War', 'Simon & Schuster Books')


SELECT * FROM tbl_book;




INSERT INTO tbl_branch
	(branch_name, branch_address)
	VALUES

	('Sharpstown', '4450 Prickly Lane, ReaderCity, WA, 99592'), --101
	('Central', '10065 Middle Street, Brooks, WA, 919191'), --102
	('Oceanside', '12 Marine North, Sandytoes, WA,  97014'),  --103
	('Riverview', '289 SE Wonderview, Waterside, WA,  98092'), --104
	('Parkdale', '317 West Greenway Blvd., Ponderosa, WA,  99229') --105

SELECT * FROM tbl_branch;





INSERT INTO tbl_borrower
	(borrower_name, borrower_address, borrower_phone)
	VALUES

	('Bill Gates', '5010 NE 36th Street, Redmond, WA, 9805', '425-703-6214'),
	('Melinda Gates', '5010 NE 36th Street, Redmond, WA, 9805', '425-703-6214'),
	('Elon Musk', '101 Centerpoint Blvd. New Castle, DE, 19720-4180',  '302-324-8910'),
	('Kimbal Musk', '101 Centerpoint Blvd. New Castle, DE, 19720-4180',  '302-324-8910'),
	('Brian Cox', 'Oxford OX1 3BD, UK', '+44 1865 270000'),
	('Karen Parks', '1301 2nd Ave, Seattle, 98999', '206-628-2111'),
	('Grace Glasal', '14951 North Dallas Parkway, Ste. 500. Dallas, TX, 75254', '817-633-8001'),
	('Clyde Johnson', '6501 SE 110th Avenue, Johnson City, OR, 97001', '917-761-1225'),
	('Marla Jackson', '2444 Dole St, Honolulu, HI, 96822', '808-956-8111'),
	('Marsha Davis', '3538 Windsor St 310 Vancouver, BC, V5V 4N2', '604-677-2898'),
	('Katherine Johnson', '12600 NASA Road Las Cruces, NM, 88012', '575-524-5131'),
	('Sir Jonny Ive', '1 Infinite Loop, Cupertino, CA, 95014', '408-606-5775'),
	('Jon Stewart', '2600 Colorado Ave, Santa Monica, CA, 90101', '310-407-4700'),
	('Bill Nye', '314 Pi Street, Los Angeles, CA, 90110', '314-159-2652'),
	('Adam James', '47000 Highway 1, Big Sur, CA, 93920', '831-667-2322'),
	('HRH Kate Middleton', 'Kensingston Palace, London, W8 4PU', '111-111-1111'),
	('Jordan Gilman', '2010 Hospitality Way, Medford, OR, 97504', '541-779-9800')

SELECT * FROM tbl_borrower;




INSERT INTO tbl_copies
	(copies_bookID, copies_branchID, copies_numberOf)
	VALUES


	(0330336193, 101, 3), --Lost Tribe				--Sharptown
	(1451663838, 101, 3), --Nov23 Stephen King

	(0007790163, 101, 2), --Longitude Genius
	(0060548258, 101, 5), --Crystal cave
	(0060850523, 101, 4), --Brave New World
	(0060894083, 101, 3), --Genome in 23 chanpters
	(0062316095, 101, 4), --Sapiens
	(0062368591, 101, 2), --Gut Microbes
	(0143038580, 101, 3), --Omnivore
	(0143117009, 101, 3), --Collapse
	(0307279464, 101, 2), --Appalachian Trail
	(0307588696, 101, 2), --AKingpin
	(1933615982, 101, 2), --Cooking Science

	

	(0330336193, 102, 3), --Lost Tribe				--Central
	(1451663838, 102, 3), --Nov23 Stephen King

	(312367546, 102, 3), --Wrinkle
	(0312421877, 102, 2), --Imagining Numbers
	(0345391802, 102, 5), --Hitchhiker
	(0345413350, 102, 4), --Gold Compass
	(0374512973, 102, 3), --Oranges
	(0375760393, 102, 4), --Botany of Desire
	(0375822747, 102, 2), --Ember
	(0375826696, 102, 3), --Eragon
	(0393317552, 102, 3), --Guns Germs
	(0393323145, 102, 2), --Seven Eves
 

	
	(0440414806, 103, 3), --Holes					--Oceanside
	(0441172717, 103, 2), --Dune
	(0465074871, 103, 5), --Rest
	(0470586958, 103, 4), --Intelligence
	(0517542021, 103, 3), --Clan
	(0553380648, 103, 4), --Kool Aid
	(0553384481, 103, 2), --Mindless Eating
	(0553447432, 103, 3), --Evicted
	(0590353403, 103, 3), --HP1
	(0689852231, 103, 2), --Scorpion
	(416936475, 103, 2), --Hatchet


	
	(0743250621, 104, 3), --Know-It-All				--Riverview
	(0743289803, 104, 2), --Messages in Water
	(0743437314, 104, 5), --Pendragon
	(0765317737, 104, 4), --White Plague
	(0805092994, 104, 3), --Sixth Extinction
	(0810989212, 104, 4), --Understand Rap
	(1328869334, 104, 2), --1984
	(1401945074, 104, 3), --Power vs. Force
	(1401302750, 104, 3), --Walk in High Heels
	(1430364910, 104, 2), --Pandemic
	(400032059, 104, 2), --1491


	
	(1451648537, 105, 3), --Jobs					--Parkdale
	(1476733503, 105, 2), --The Gene
	(1494812509, 105, 5),  --Walden
	(1570610444, 105, 4), --Slug Tossing
	(1580170277, 105, 3), --Carrots Love Tomatoes
	(1591024757, 105, 4), --Fabulous Fibonacci
	(1595348050, 105, 2), --Tides
	(1608196100, 105, 3), --The Grid
	(1771642483, 105, 3), --Trees
	(1932100660, 105, 3),  --China Study
	(1936276011, 105, 2) --Art Of War


SELECT * FROM tbl_copies;






INSERT INTO tbl_loans
	(loans_bookID, loans_branchID, loans_borrowerID, loans_dateOut, loans_dueDate)
	VALUES

	(0330336193, 101, 1001, '20170616', '20170812'), --Bill Gates
	(0307588696, 101, 1001, '20170616', '20170813'),
	(0465074871, 103, 1001, '20170616', '20170814'),
	(1451648537, 105, 1001, '20170616', '20170815'),
	(1608196100, 105, 1001, '20170616', '20170812'),
	(0553447432, 103, 1002, '20170616', '20170813'), --Melinda Gates
	(1451648537, 105, 1002, '20170616', '20170814'),
	(0465074871, 103, 1004, '20170616', '20170914'), --Kimbal Musk
	(1580170277, 105, 1004, '20170616', '20170812'),
	(0765317737, 104, 1005, '20170616', '20170813'), --Brian Cox
	(1936276011, 105, 1008, '20170616', '20170914'), --Clyde Johnson
	(0062316095, 101, 1010, '20170616', '20170812'), --Marsha Davis
	(1591024757, 105, 1011, '20170616', '20170813'), --Katherine Johnson
	(0312421877, 102, 1011, '20170616', '20170814'),
	(0007790163, 101, 1011, '20170616', '20170914'),
	(1608196100, 105, 1011, '20170616', '20170812'),
	(0470586958, 103, 1011, '20170616', '20170914'),
	(1591024757, 105, 1001, '20170616', '20170812'), --Sir Jonny Ive
	(0330336193, 102, 1013, '20170616', '20170914'), --Jon Stewart
	(810989212, 104, 1013, '20170616', '20170813'),
	(1570610444, 105, 1013, '20170616', '20170914'), 
	(0330336193, 101, 1001, '20170616', '20170813'), --Bill Nye
	(0465074871, 103, 1014, '20170616', '20170914'),
	(1608196100, 105, 1014, '20170616', '20170812'),
	(1771642483, 105, 1014, '20170616', '20170814'),
	(0470586958, 103, 1014, '20170616', '20170813'),
	(0307588696, 101, 1016, '20170616', '20170812') --HRH Kate Middleton 


SELECT * FROM tbl_loans;







INSERT INTO tbl_author
	(author_bookID, author_name)
	VALUES

	(0330336193, 'Edward Marriott'),
	(1451663838, 'Stephen King'),
	(0007790163, 'Dava Sobel'),
	(0060548258, 'Mary Stewart'),
	(0060850523, 'Aldous Huxley'),
	(0060894083, 'Matt Ridley'),
	(0062316095, 'Yuval Noah Harari'),
	(0062368591, 'Ed Yong'),
	(0143038580, 'Michael Pollan'),
	(0143117009, 'Jared Diamond'),
	(0307279464, 'Bill Bryson'),
	(0307588696, 'Kevin Poulsen'),
	(0312367546, 'Madeleine L''Engle'),
	(0312421877, 'Barry Mazur'),
	(0345391802, 'Douglas Adams'),
	(0345413350, 'Philip Pullman'),
	(0374512973, 'John McPhee'),
	(0375760393, 'Michael Pollan'),
	(0375822747, 'Jeanne DuPrau'),
	(0375826696, 'Christopher Paolini'),
	(0393317552, 'Jared M. Diamond'),
	(0393323145, 'Bryan Sykes'),
	(0440414806, 'Louis Sachar'),
	(0441172717, 'Frank Herbert'),
	(0465074871, 'Alex Soojung-Kim Pang'),
	(0470586958, 'Satoshi Kanazawa'),
	(0517542021, 'Jean M. Auel'),
	(0553380648, 'Tom Wolfe'),
	(553384481, 'Brian Wansink'),
	(553447432, 'Matthew Desmond'),
	(0590353403, 'J.K. Rowling'),
	(0689852231, 'Nancy Farmer'),
	(0743250621, 'A. J. Jacobs'),
	(0743289803, 'Masaru Emoto'),
	(0743437314, 'D.J. MacHale'),
	(0765317737, 'Frank Herbert'),
	(0805092994, 'Elizabeth Kolbert'),
	(0810989212, 'William Buckholz'),
	(1328869334, 'George Orwell'),
	(1401945074, 'David R. Hawkins M.D. Ph.D.'),
	(1401302750, 'Camilla Morton'),
	(1430364910, 'John M. Barry'),
	(1451648537, 'Walter Issacson'),
	(1476733503, 'Siddhartha Mukherjee'),
	(1494812509, 'Henry David Thoreau'),
	(1570610444, 'Meg Descamp'),
	(1580170277, 'Louise Riotte'),
	(1591024757, 'Alfred S. Posamentier and Ingmar Lehmann'),
	(1595348050, 'Jonathan White'),
	(1608196100, 'Gretchen Bakke'),
	(1771642483, 'Peter Wohlleben'),
	(1932100660, 'T. Colin Campbell, M.D. and Thomas M. Campbell II'),
	(1933615982, 'The Editors of America''s Test Kitchen and Guy Crosby Ph.D'),
	(1936276011, 'Sun Tzu'),
	(400032059, 'Charles C. Mann'),
	(416936475, 'Gary Paulsen')

		

SELECT * FROM tbl_author;




/*****************************************************
			... the queries ...
******************************************************/


/*
How many copies of the book titled "The Lost Tribe" 
are owned by the library branch whose name is "Sharpstown"?
*/


SELECT
	bk.book_title AS 'Book Title',
	cy.copies_numberOf AS 'Copies',
	bh.branch_name AS 'Location'

	FROM tbl_book bk
		INNER JOIN tbl_copies cy
			ON bk.book_id = cy.copies_bookID
		INNER JOIN tbl_branch bh
			ON bh.branch_id = cy.copies_branchID

WHERE book_title = 'The Lost Tribe' AND branch_name = 'Sharpstown'
;




/*
How many copies of the book titled "The Lost Tribe" 
are owned by each library branch?
*/


SELECT
	bk.book_title AS 'Book Title',
	cy.copies_numberOf AS 'Copies',
	bh.branch_name AS 'Location'

	FROM tbl_book bk
		INNER JOIN tbl_copies cy
			ON bk.book_id = cy.copies_bookID
		INNER JOIN tbl_branch bh
			ON bh.branch_id = cy.copies_branchID

	WHERE bk.book_title = 'The Lost Tribe'
;




/*
Retrieve the names of all borrowers 
who do not have any books checked out.
*/

SELECT
	br.borrower_name AS 'Inactive User Name'

	FROM tbl_borrower br
		LEFT JOIN tbl_loans ls
			ON br.borrower_id = ls.loans_borrowerID

	WHERE ls.loans_borrowerID IS NULL
;


/*
For each book that is loaned out from the "Sharpstown" branch 
and whose DueDate is today, 
retrieve the book title, the borrower's name, and the borrower's address.
*/


USE db_CountyLibrary;

SELECT
	br.borrower_name AS 'Loaned to',
	bk.book_title AS 'Book Title',
	br.borrower_address AS 'Address'

	FROM tbl_book bk
		INNER JOIN tbl_loans ls
			ON ls.loans_bookID = bk.book_id
		INNER JOIN tbl_borrower br
			ON br.borrower_id = ls.loans_borrowerID
		INNER JOIN tbl_branch bh
			ON bh.branch_id = ls.loans_branchID

	WHERE bh.branch_name = 'Sharpstown' AND ls.loans_dueDate = '20170812'
;




/*
For each library branch, retrieve the branch name and 
the total number of books loaned out from that branch.
*/


SELECT 
	bh.branch_name AS 'Location',
	COUNT(ls.loans_bookID) AS 'Number Books Out'
	FROM tbl_loans ls
		INNER JOIN tbl_branch bh
			ON ls.loans_branchID = bh.branch_id
	GROUP BY bh.branch_name
;



/*
Retrieve the names, addresses, and number of books checked out 
for all borrowers who have more than five books checked out.
*/


SELECT
	br.borrower_name AS 'Loaned to',
	--br.borrower_address AS 'Address',
	COUNT(ls.loans_bookID) AS 'Number Books Out'

	FROM tbl_loans ls
		INNER JOIN tbl_borrower br
			ON ls.loans_borrowerID = br.borrower_id

	GROUP BY br.borrower_name

	HAVING COUNT(ls.loans_bookID) > 4
;


/*
For each book authored (or co-authored) by "Stephen King", 
retrieve the title and the number of copies 
owned by the library branch whose name is "Central".
*/

SELECT
	bk.book_title AS 'Book Title',
	cy.copies_numberOf AS 'Copies',
	bh.branch_name AS 'Location'

	FROM tbl_book bk
		INNER JOIN tbl_copies cy
			ON bk.book_id = cy.copies_bookID
		INNER JOIN tbl_branch bh
			ON bh.branch_id = cy.copies_branchID
		INNER JOIN tbl_author ar
			ON ar.author_bookID = bk.book_id

WHERE ar.author_name = 'Stephen King' AND bh.branch_name = 'Central'
;


