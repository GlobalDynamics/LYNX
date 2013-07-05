<%@ page import="account.Login" %>
<%@ page import="groups.UserGroups" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Iterator" %>
<%
	if (session.getAttribute("login") == null) {
		response.sendRedirect("login.jsp");
	} else {
		String login = (String) session.getAttribute("login");
		if (login.equals("1")) {
			if(request.getParameter("type") != null)
			{
				if(((String) request.getParameter("type")).equals("aGroup"))
				{
					String usergroupName = request.getParameter("uname");
					if(UserGroups.checkGroup(usergroupName) != 1)
					{
						UserGroups.addGroup(usergroupName);
						response.sendRedirect("usergroups.jsp");
					}
					else
					{
						session.setAttribute("error","Group already exists.");
						response.sendRedirect("result.jsp");
					}
				
				
			}
				else if(((String) request.getParameter("type")).equals("rGroup"))
				{
					Map params = request.getParameterMap();  
					
					for (Iterator iterator = params.entrySet().iterator(); iterator.hasNext();)  {  
					    Map.Entry entry = (Map.Entry) iterator.next();  
					    System.out.println("parameter name:"+entry.getKey());  
					    System.out.println("value:"+request.getParameter(entry.getKey().toString())); 
					    if(entry.getKey().toString().contains("groupRemove"))
					    {
					    	int groupID = Integer.parseInt(request.getParameter(entry.getKey().toString()));
					    	UserGroups.removeGroup(groupID);
							
					    }
				    }  
					response.sendRedirect("usergroups.jsp");
				}
	
			
		} else {
			response.sendRedirect("login.jsp");
		}
	}
}
	%>