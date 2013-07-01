<%@ page import="account.Login" %>
<%@ page import="person.PersonController" %>
<%
	if (session.getAttribute("login") == null || session.getAttribute("accountID") ==  null) {
		response.sendRedirect("login.jsp");
	} else {
		String login = (String) session.getAttribute("login");
		String accountID = (String) session.getAttribute("accountID");
		String fname = null; 
		String lname = null; 
		if (login.equals("1")) {
			if(request.getParameter("type") != null)
			{
				if(((String) request.getParameter("type")).equals("aTeacher"))
				{
					int personID = Integer.parseInt(request.getParameter("teachers"));
					PersonController.addTeacher(personID);
					response.sendRedirect("addteacher.jsp");
				}
				else if(((String) request.getParameter("type")).equals("rTeacher"))
				{
					int teacherID = Integer.parseInt(request.getParameter("teachers"));
					PersonController.removeTeacher(teacherID);
					response.sendRedirect("removeteacher.jsp");
				}
				
				else if(((String) request.getParameter("type")).equals("eTeacher"))
				{
					int teacherID = Integer.parseInt(request.getParameter("teachers"));
					int personID = Integer.parseInt(request.getParameter("people"));
					PersonController.editTeacher(teacherID,personID);
					response.sendRedirect("editteacher.jsp");
				}
			}
	
			
		} else {
			response.sendRedirect("login.jsp");
		}
	}
	%>