IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'userNotice')
BEGIN
    CREATE TABLE userNotice
	(
		noticeID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
		noticeType INT NOT NULL,
		noticeText VARCHAR(2000) NOT NULL
	)
END