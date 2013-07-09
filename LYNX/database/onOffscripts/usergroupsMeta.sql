IF NOT EXISTS (SELECT 1 FROM usergroups)
BEGIN
	INSERT INTO usergroups(name, [default], active) 
	VALUES ('N/A', 1, 1), 
	('Administrator', 1, 1),  
	('Student', 1, 1), 
	('Teacher', 1, 1)
END
