IF NOT EXISTS (SELECT 1 FROM division)
BEGIN
	INSERT INTO division (alternateID,name, url, active) 
	VALUES (1,'Dashboard', 'main.jsp', 1),  
	(2,'Students','#',1),
	(3, 'Teachers','#',1),
	(4,'People','#',1),
	(5,'Students','#',1),
	(6,'Courses','#',1),
	(7,'Grades','#',1),
	(8,'Enrollment','#',1),
	(9,'Calendar','#',1),
	(10,'Administration','#',1)
END
