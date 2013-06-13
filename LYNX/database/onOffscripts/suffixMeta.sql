IF NOT EXISTS (SELECT 1 FROM metaData WHERE [type] = 'suffix')
BEGIN
	INSERT INTO metaData (data, [type]) 
		VALUES ('N/A', 'suffix'),  
		('Ms.', 'suffix'), 
		('Mr.','suffix'),
		('Mrs.','suffix')
END