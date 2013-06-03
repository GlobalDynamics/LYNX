<%@ page import="account.Login" %>
<%@ page import="person.PersonController" %>
<%
	if (session.getAttribute("login") == null) {
		response.sendRedirect("login.jsp");
	} else {
		String login = (String) session.getAttribute("login");
		String fname = null; 
		String lname = null; 
		String mname = null; 
		String suf = null; 
		String gen = null; 
		String birth = null; 
		String username = null; 
		String password1 = null; 
		String password2 = null; 
		if (login.equals("1")) {
			if(request.getParameter("type") != null)
			{
				if(((String) request.getParameter("type")).equals("aPerson"))
				{
					
						fname = (String) request.getParameter("fname");
						 lname = (String) request.getParameter("lname");
						 mname = (String) request.getParameter("mname");
						 suf = (String) request.getParameter("suffix");
						 gen = (String) request.getParameter("gender");
						 birth = (String) request.getParameter("birth");
						 username = request.getParameter("username");
						 password1 = request.getParameter("password1");
						 password2 = request.getParameter("password2");
						 if(PersonController.validateData(fname.length(), lname.length(), mname.length(), suf.length(), gen.length(), birth) == 1)
							{
							 PersonController.addPerson(fname,  lname,  mname,  suf, 1, 1, gen, birth,password1,password2,username);
								response.sendRedirect("addperson.jsp");
							}
							else
							{
								session.setAttribute("error","Field length exceeds limit.");
								response.sendRedirect("addperson.jsp");
							}
					 
				}
				else if(((String) request.getParameter("type")).equals("rPerson"))
				{
					String personID = (String) request.getParameter("people");
					PersonController.removePerson(Integer.parseInt(personID));
					response.sendRedirect("removeperson.jsp");
				}
				else if(((String) request.getParameter("type")).equals("ePerson"))
				{
					int personID = Integer.parseInt(request.getParameter("personID"));
					fname = (String) request.getParameter("fname");
					 lname = (String) request.getParameter("lname");
					 mname = (String) request.getParameter("mname");
					 suf = (String) request.getParameter("suffix");
					 gen = (String) request.getParameter("gender");
					 birth = (String) request.getParameter("birth");
					 username = request.getParameter("username");
					 password1 = request.getParameter("password1");
					 password2 = request.getParameter("password2");
					PersonController.editPerson(personID, fname, lname, mname,
							 suf, 1, 1, gen,  birth,
							 password1,  password2, username);
					response.sendRedirect("epreview.jsp");
				}
			}
			
			
					
			
			
			
			
			
			
		} else {
			response.sendRedirect("login.jsp");
		}
	}
	%>