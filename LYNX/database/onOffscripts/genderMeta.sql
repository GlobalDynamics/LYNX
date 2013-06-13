IF NOT EXISTS (SELECT 1 FROM metaData WHERE [type] = 'gender')
BEGIN
	INSERT INTO metaData (data, [type]) 
	VALUES ('N/A', 'gender'),  ('Female', 'gender'),  ('Male','gender'), ('Other','gender')
END