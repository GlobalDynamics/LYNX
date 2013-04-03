IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'grade')
BEGIN
    CREATE TABLE grade
	(
		gradeID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
		courseID INT NOT NULL,
		enrollmentID INT NOT NULL,
		studentID INT NOT NULL,
		grade VARCHAR(1) NOT NULL
	)
END