<%@ page import="account.Login" %>
<%@ page import="person.PersonController" %>
<%
	if (session.getAttribute("login") == null || session.getAttribute("accountID") ==  null) {
		response.sendRedirect("login.jsp");
	} else {
		String login = (String) session.getAttribute("login");
		String fname = null; 
		String lname = null; 
		if (login.equals("1")) {
			if(request.getParameter("type") != null)
			{
				if(((String) request.getParameter("type")).equals("aStudent"))
				{
					int personID = Integer.parseInt(request.getParameter("people"));
					PersonController.linkToStudent(personID);
					response.sendRedirect("addstudent.jsp");
				}
				else if(((String) request.getParameter("type")).equals("rStudent"))
				{
					int studentID = Integer.parseInt(request.getParameter("students"));
					PersonController.unlinkStudent(studentID);
					response.sendRedirect("removestudent.jsp");
				}
				
				else if(((String) request.getParameter("type")).equals("eStudent"))
				{
					int studentID = Integer.parseInt(request.getParameter("students"));
					int personID = Integer.parseInt(request.getParameter("people"));
					PersonController.updateLink(studentID,personID);
					response.sendRedirect("editstudent.jsp");
				}
			}
			
			
					
			
			
			
			
			
			
		} else {
			response.sendRedirect("login.jsp");
		}
	}
	%>