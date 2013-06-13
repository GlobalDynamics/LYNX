

IF NOT EXISTS (SELECT 1 FROM metaData WHERE [type] = 'language')
BEGIN
	INSERT INTO metaData (data, [type]) 
		VALUES ('N/A', 'language'),  
		('English', 'language'), 
		('Arabic','language'),
		('Bengali','language'),
		('Chinese','language'),
		('French','language'),
		('German','language'),
		('Hindi','language'),
		('Arabic','language'),
		('Italian','language'),
		('Japanese','language'),
		('Korean','language'),
		('Malay','language'),
		('Polish','language'),
		('Portuguese','language'),
		('Russian','language'),
		('Somali','language'),
		('Spanish','language'),
		('Thai','language'),
		('Turkish','language'),
		('Urdu','language'),
		('Vietnamese','language')
END