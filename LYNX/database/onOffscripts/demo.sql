IF NOT EXISTS (SELECT 1 FROM accounts WHERE personID = 1)
BEGIN
	INSERT INTO accounts(personID,username,hash,salt)
	VALUES('1','admin','MNPJUgH6jQ49fhbCIsHIUTxzlWu8MaWnpBT2bq4t9DtQtMmBntAw4+lcW094OLUCR/7QgQEhrvgP+lFyATufzQ==','sgu34s26egusntbglkh9aj4cpv')
END