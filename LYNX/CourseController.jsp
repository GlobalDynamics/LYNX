<%@ page import="account.Login" %>
<%@ page import="course.CourseController" %>
<%@ page import="course.Grade" %>
<%
	if (session.getAttribute("login") == null) {
		response.sendRedirect("login.jsp");
	} else {
		String login = (String) session.getAttribute("login");
		String fname = null; 
		String lname = null; 
		if (login.equals("1")) {
			if(request.getParameter("type") != null)
			{
				if(((String) request.getParameter("type")).equals("aSubject"))
				{
					String name = (String) request.getParameter("sname");
					int calendarID = Integer.parseInt(request.getParameter("calendars"));
					CourseController.addSubject(name,calendarID);
					response.sendRedirect("addsubject.jsp");
				}
				else if(((String) request.getParameter("type")).equals("rSubject"))
				{
					int subjectID = Integer.parseInt(request.getParameter("subjects"));
					CourseController.removeSubject(subjectID);
					response.sendRedirect("removesubject.jsp");
				}
				
				else if(((String) request.getParameter("type")).equals("eSubject"))
				{
					int subjectID = Integer.parseInt(request.getParameter("subjects"));
					String name = (String) request.getParameter("sname");
					CourseController.editSubject(subjectID,name);
					response.sendRedirect("editsubject.jsp");
				}
				
				else if(((String) request.getParameter("type")).equals("aCourse"))
				{
					
					int subjectID = Integer.parseInt(request.getParameter("subjects"));
					int teacherID = Integer.parseInt(request.getParameter("teachers"));
					int calendarID = Integer.parseInt(request.getParameter("calendars"));
					String name = (String) request.getParameter("cname");
					String sname = (String) request.getParameter("sname");
					if(CourseController.validateCourseDate(name.length(), sname.length()) == 1)
					{
						CourseController.createCourse(name,sname,subjectID,teacherID, calendarID);
						response.sendRedirect("addcourse.jsp");
					}
					else
					{
						session.setAttribute("error", "Invalid data was entered.");
						response.sendRedirect("result.jsp");
					}
					
				}
				
				else if(((String) request.getParameter("type")).equals("rCourse"))
				{
					int courseID = Integer.parseInt(request.getParameter("courses"));
					CourseController.removeCourse(courseID);
					response.sendRedirect("removecourse.jsp");
				}
				
				else if(((String) request.getParameter("type")).equals("eCourse"))
				{
					int courseID = Integer.parseInt(request.getParameter("courses"));
					int subjectID = Integer.parseInt(request.getParameter("subjects"));
					int teacherID = Integer.parseInt(request.getParameter("teachers"));
					int calendarID = Integer.parseInt(request.getParameter("calendars"));
					String name = (String) request.getParameter("cname");
					String sname = (String) request.getParameter("sname");
					CourseController.editCourse(courseID,name,sname,subjectID,teacherID,calendarID);
					response.sendRedirect("editcourse.jsp");
				}
				
				else if(((String) request.getParameter("type")).equals("aGrade"))
				{
					int enrollmentID = Integer.parseInt(request.getParameter("enroll"));
					String grade = (String) request.getParameter("grade");
					Grade.addGrade(enrollmentID,grade);
					session.setAttribute("enroll",null);
					response.sendRedirect("gradepreview.jsp");
				}
				
				else if(((String) request.getParameter("type")).equals("rGrade"))
				{
					int gradeID = Integer.parseInt(request.getParameter("courses"));
					Grade.removeGrade(gradeID);
					response.sendRedirect("gradepreview1.jsp");
				}
				
			}
			
			
					
			
			
			
			
			
			
		} else {
			response.sendRedirect("login.jsp");
		}
	}
	%>