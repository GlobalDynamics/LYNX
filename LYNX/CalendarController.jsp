<%@ page import="account.Security" %>
<%@ page import="account.Login" %>
<%@ page import="schedule.CalendarController" %>
<%
	if (session.getAttribute("login") == null || session.getAttribute("accountID") ==  null) {
		response.sendRedirect("login.jsp");
	} else {
		String login = (String) session.getAttribute("login");
		String username = (String) session.getAttribute("username");
		String accountID = Security.getGroupID(username);
		String fname = null; 
		String lname = null; 
		if (login.equals("1")) {
			if(request.getParameter("type") != null)
			{
				if(((String) request.getParameter("type")).equals("aCalendar"))
				{
					String name = (String) request.getParameter("cname");
					String start = (String) request.getParameter("start");
					String end = (String) request.getParameter("end");
					CalendarController.createCalendar(name,start,end);
					response.sendRedirect("addcalendar.jsp");
				}
				else if(((String) request.getParameter("type")).equals("rCalendar"))
				{
					int calendarID = Integer.parseInt(request.getParameter("calendars"));
					CalendarController.removeCalendar(calendarID);
					response.sendRedirect("removecalendar.jsp");
				}
				else if(((String) request.getParameter("type")).equals("eCalendar"))
				{
					int calendarID = Integer.parseInt(request.getParameter("calendars"));
					String name = (String) request.getParameter("cname");
					String start = (String) request.getParameter("start");
					String end = (String) request.getParameter("end");
					CalendarController.editCalendar(calendarID,name,start,end);
					response.sendRedirect("editcalendar.jsp");
				}
				
			}
			
			
					
			
			
			
			
			
			
		} else {
			response.sendRedirect("login.jsp");
		}
	}
	%>