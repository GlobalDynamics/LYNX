IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'permissions')
BEGIN
    CREATE TABLE permissions
	(
		permissionID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
		moduleID INT NOT NULL,
		accountID INT NOT NULL,
		userGroup INT NOT NULL,
		accessType INT
	)
END

