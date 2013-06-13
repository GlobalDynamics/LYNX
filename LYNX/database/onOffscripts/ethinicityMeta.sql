IF NOT EXISTS (SELECT 1 FROM metaData WHERE [type] = 'ethinicity')
BEGIN
	INSERT INTO metaData (data, [type]) 
		VALUES ('N/A', 'ethinicity'), 
		('White, Non-Hispanic','ethinicity'),
		('Black, Non-Hispanic','ethinicity'),
		('Hispanic','ethinicity'),
		('American Indian or Native Alaskan','ethinicity'),
		('Pacific Islander','ethinicity')
END