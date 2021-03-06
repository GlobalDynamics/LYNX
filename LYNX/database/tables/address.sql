IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Address')
BEGIN
    CREATE TABLE address
	(
		addressID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
		street VARCHAR(100) NOT NULL,
		zipcode VARCHAR(10) NOT NULL,
		apt VARCHAR(10) NOT NULL,
		house_no VARCHAR(10) NULL,
		direction VARCHAR(1) NOT NULL,
		state VARCHAR(15) NOT NULL,
		city VARCHAR(20) NOT NULL,
		phone VARCHAR(10) NOT NULL,
		country VARCHAR(20) NOT NULL,
		email VARCHAR(50) NULL
	)
END

