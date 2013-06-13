IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'metaData')
BEGIN
    CREATE TABLE metaData
	(
		metaID  INT IDENTITY(1,1) PRIMARY KEY,
		alternateID INT NULL,
		[type] VARCHAR(10),
		data VARCHAR(100)
	)
END