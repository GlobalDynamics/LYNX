<%@ page import="account.Login" %>
<%@ page import="account.Security" %>
<%@ page import="person.PersonController" %>
<%@ page import="person.AddressController" %>
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
		String street = null;
		String state = null;
		String city = null;
		String zip = null;
		String country = null;
		String direction = null;
		String house = "";
		
		String apt = "";
		
		String phone = null;
		String email = "";
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
						 
						 //Address
						 
						street = (String) request.getParameter("street");
						state = (String) request.getParameter("state");
						city = (String) request.getParameter("city");
						zip = (String) request.getParameter("zip");
						country = (String) request.getParameter("country");
						direction = (String) request.getParameter("dir");
						house = ((String) request.getParameter("house") != null) ? (String) request.getParameter("house"): "";
						apt = ((String) request.getParameter("apt") != null) ? (String) request.getParameter("apt"): "";
						
						//contact
						
						 phone = (String) request.getParameter("phone");
						 email = ((String) request.getParameter("email") != null) ?(String) request.getParameter("email") : "";
						 String personValidate = PersonController.validateData(fname.length(), lname.length(), mname.length(), suf.length(), gen.length(), birth);
						 String secure = (String) Security.complexityTest(password1, password2);
						 String address = AddressController.validateAddress(street.length(), zip.length(), city.length(), country.length(), direction.length(), state.length(), apt.length(), house.length(), phone.length());
						 if(personValidate == "true" && secure == "true" && address =="true")
							{
							 PersonController.addPerson(fname,  lname,  mname,  suf, 1, 1, gen, birth,password1,password2,username);
							 AddressController.createAddress(street, zip, city, country, direction, state, apt, house, phone, email);
								response.sendRedirect("addperson.jsp");
							}
							else
							{
								session.setAttribute("error",secure.replace("true", "") + "\n" + personValidate.replace("true", "") + address.replace("true", ""));
								response.sendRedirect("result.jsp");
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
					 
					 //Address
					 
						street = (String) request.getParameter("street");
						state = (String) request.getParameter("state");
						city = (String) request.getParameter("city");
						zip = (String) request.getParameter("zip");
						country = (String) request.getParameter("country");
						direction = (String) request.getParameter("dir");
						
						//contact
						
						 phone = (String) request.getParameter("phone");
						 email = (String) request.getParameter("email");
					 
					 String personValidate = PersonController.validateData(fname.length(), lname.length(), mname.length(), suf.length(), gen.length(), birth);
					 String secure = (String) Security.complexityTest(password1, password2);
					 if(personValidate == "true" && secure == "true")
						{
						 PersonController.editPerson(personID, fname, lname, mname,
								 suf, 1, 1, gen,  birth,
								 password1,  password2, username);
						response.sendRedirect("epreview.jsp");
						}
						else
						{
							session.setAttribute("error",secure + personValidate.replace("true", ""));
							response.sendRedirect("result.jsp");
						}
					 
					
				}
			}
			
			
					
			
			
			
			
			
			
		} else {
			response.sendRedirect("login.jsp");
		}
	}
	%>