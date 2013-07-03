<%@ page import="account.Login" %>
<%@ page import="account.Security" %>
<%@ page import="account.CreateAccount;" %>
<%	


            String username = request.getParameter("Username");
			String password = request.getParameter("password");
            String logged =  Login.login(password, username);
			if (logged.equals("1"))
			{
				String usergroupID = Security.getGroupID(username);
				session.setAttribute("login","1");
				session.setAttribute("username",username);
				System.out.println(usergroupID);
				session.setAttribute("accountID", usergroupID);
				response.sendRedirect("main.jsp");
			}
			else
			{
				session.setAttribute("login","0");
				response.sendRedirect("login.jsp");
			}
			
			//String username = request.getParameter("Username");
			//String password1 = request.getParameter("password1");
			//String password2 = request.getParameter("password2");
			//CreateAccount.createAccount(password1, password2, username);

%> 