IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'course')
BEGIN
    CREATE TABLE course
	(
		courseID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
		subjectID INT NOT NULL,
		calendarID INT NOT NULL,
		name VARCHAR(50) NOT NULL,
		shortName VARCHAR(10) NOT NULL,
		teacherID INT NOT NULL

	)
END