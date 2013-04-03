IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'teacher')
BEGIN
    CREATE TABLE teacher
	(
		teacherID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
		personID INT NOT NULL,
		accountID INT NOT NULL

	)
END