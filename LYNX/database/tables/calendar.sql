IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'calendar')
BEGIN
    CREATE TABLE calendar
	(
		calendarID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
		name VARCHAR(50) NOT NULL,
		startDate DATE NOT NULL,
		endDate DATE NOT NULL
	)
END