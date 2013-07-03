IF NOT EXISTS (SELECT 1 FROM module)
BEGIN
	INSERT INTO module(divisionID, title, name, url, active) 
	VALUES (9,'Add a Calendar', 'Calendar Module','addcalendar.jsp' , 1),  
	(6,'Add a Course', 'Course Module' ,'addcourse.jsp' , 1),
	(4,'Add a Person','Person Module','addperson.jsp' , 1),
	(2,'Add a Student', 'Student Module' ,'addstudent.jsp' , 1),
	(6,'Add a Subject','Course Module','addsubject.jsp' , 1),
	(3,'Add a Teacher','Teacher Module','addteacher.jsp' , 1),
	(9,'Edit a Calendar', 'Calendar Module','editcalendar.jsp' , 1),
	(6,'Edit a Course', 'Course Module' ,'editcourse.jsp' , 1),
	(4,'Edit a Person','Person Module','editperson.jsp' , 1),
	(2,'Edit a Student', 'Student Module' ,'editstudent.jsp' , 1),
	(6,'Edit a Subject','Course Module','editsubject.jsp' , 1),
	(3,'Edit a Teacher','Teacher Module','editteacher.jsp' , 1),
	(8,'Enroll in Courses','Enrollment Module','enrollcourse.jsp' , 1),
	(8,'Withdraw from Course','Enrollment Module','withdrawcourse.jsp' , 1),
	(8,'Show Schedule','Enrollment Module','schedule.jsp' , 1),
	(7,'None','Grades Module','entergrade.jsp' , 0),
	(7,'Add Grades','Grades Module','gradepreview.jsp' , 1),
	(7,'Remove Grades','Grades Module','gradepreview1.jsp' , 1),
	(7,'None','Grades Module','grades.jsp' , 0),
	(6,'Transfer Courses', 'Course Module' ,'transfercourse.jsp' , 1),
	(9,'Remove a Calendar', 'Calendar Module','removecalendar.jsp' , 1),
	(6,'Remove a Course', 'Course Module' ,'removecourse.jsp' , 1),
	(7,'None','Grades Module','removegrade.jsp' , 0),
	(4,'Remove a Person','Person Module','removeperson.jsp' , 1),
	(2,'Remove a Student', 'Student Module' ,'removestudent.jsp' , 1),
	(6,'Remove a Subject','Course Module','removesubject.jsp' , 1),
	(3,'Remove a Teacher','Teacher Module','removeteacher.jsp' , 1),
	(10,'Permissions','Permissions Module','permissions.jsp' , 1),
	(10,'User Groups','Permissions Module','usergroups.jsp' , 1),
	(1,'None', 'NA', 'main.jsp' , 1)
END

