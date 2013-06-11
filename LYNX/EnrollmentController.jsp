<%@ page import="account.Login" %>
<%@ page import="course.EnrollmentController" %>
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
				if(((String) request.getParameter("type")).equals("aEnroll"))
				{
					int studentID = Integer.parseInt(request.getParameter("students"));
					int courseID = Integer.parseInt(request.getParameter("courses"));
					System.out.println(courseID);
					System.out.println(studentID);
					if(EnrollmentController.checkStudentEnroll(courseID,studentID) != 1)
					{
						EnrollmentController.enrollCourse(courseID,studentID);
						response.sendRedirect("enrollcourse.jsp");
						session.setAttribute("enroll","");
					}
					else
					{
						session.setAttribute("enroll","Student is already enrolled in this course.");
						response.sendRedirect("result.jsp");
					}
					
				}
				else if(((String) request.getParameter("type")).equals("rEnroll"))
				{
					int enrollmentID = Integer.parseInt(request.getParameter("courses"));
					EnrollmentController.unenrollCourse(enrollmentID);
					response.sendRedirect("withdrawcourse.jsp");
					
				}
				
				
			}
			
			
					
			
			
			
			
			
			
		} else {
			response.sendRedirect("login.jsp");
		}
	}
	%>