<%@ page import="account.Login" %>
<%@ page import="person.PersonController" %>
<%@ page import="person.AddressController" %>
<%@ page import="person.Address" %>
<%@ page import="person.Person" %>
<%@ page import = "java.util.List" %>
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
		String user = null;
		int personID = -1;
		int addressID = -1;
		
		String street = null;
		String state = null;
		String city = null;
		String zip = null;
		String country = null;
		String direction = null;
		String house = "";
		
		String apt = "";
		String ethinicity = null;
		String language = null;
		
		String phone = null;
		String email = "";
		
		List<String> countryList = null;
		List<String> languageList = null;
		List<String> ethinList = null;
		List<String> suffixList = null;
		List<String> genderList = null;
		if (login.equals("1")) {
			String username = (String) session.getAttribute("username");
			if(request.getParameter("type") != null)
			{
				if(((String) request.getParameter("type")).equals("ePerson"))
				{
					Person temp = PersonController.getPerson(Integer.parseInt(request.getParameter("people")));
					 personID = Integer.parseInt(temp.getID());
					 addressID = Integer.parseInt(temp.getAddress());
					 Address ad = AddressController.getAddress(addressID);
					 fname = temp.getFirstName();
					 lname = temp.getLastName();
					 mname = temp.getMiddleName();
					 suf = temp.getSuffix();
					 gen = temp.getGender();
					 birth = temp.getBirth();
					 user = temp.getUser();
					 
					 ethinicity = temp.ethinitiy;
					 language = temp.language;
					 
					 
					 //Address
					 
					street = ad.street;
					state = ad.state;
					city = ad.city;
					zip = ad.zipcode;
					apt = ad.apt;
					house = ad.house;
					country = ad.country;
					direction = ad.direction;
					phone = ad.phone;
					email = ad.email;
					
					 countryList = PersonController.getSelectList("country");
					 languageList =  PersonController.getSelectList("language");
					 ethinList =  PersonController.getSelectList("ethinicity");
					 suffixList = PersonController.getSelectList("suffix");
					 genderList = PersonController.getSelectList("gender");
					//PersonController.editPerson(personID,fname,  lname,  mname,  suf, 1, 1, gen, birth,password1,password2);
				}
			}
	%>

	<!DOCTYPE html>
	<!--[if lt IE 7 ]><html class="ie ie6" dir="ltr" lang="en-US"> <![endif]-->
	<!--[if IE 7 ]><html class="ie ie7" dir="ltr" lang="en-US"> <![endif]-->
	<!--[if IE 8 ]><html class="ie ie8" dir="ltr" lang="en-US"> <![endif]-->
	<!--[if (gte IE 9)|!(IE)]><!-->
	<html dir="ltr" lang="en-US">
	<!--<![endif]-->
	<head>
	<meta charset="UTF-8" />
	<meta name="viewport"
		content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;" />

	<title>SIS Main Page</title>

<link rel="stylesheet" href="css/dash/ui-lightness/jquery-ui-1.8.18.custom.css" type="text/css" media="screen" />
<link rel="stylesheet" href="css/dash/validationEngine.jquery.css" type="text/css"/>
<link rel="stylesheet" href="css/dash/icons.css" type="text/css" />
<link rel="stylesheet" href="css/dash/forms.css" type="text/css" />
<link rel="stylesheet" href="css/dash/tables.css" type="text/css" />
<link rel="stylesheet" href="css/dash/ui.css" type="text/css" />
<link rel="stylesheet" href="css/dash/style.css" type="text/css" />
<link rel="stylesheet" href="css/dash/responsiveness.css" type="text/css" />

<!-- jQuery -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.23/jquery-ui.min.js"></script>
<!-- Spinner -->
<script type="text/javascript" src="scripts/jquery.mousewheel.min.js"></script>
<script type="text/javascript" src="scripts/jquery.ui.spinner.js"></script>
<!-- Validation engine -->
<script type="text/javascript" src="scripts/languages/jquery.validationEngine-en.js" charset="utf-8"></script>
<script type="text/javascript" src="scripts/jquery.validationEngine.js"></script>
<!-- Knob -->
<script type="text/javascript" src="scripts/jquery.knob.js"></script>
<!-- Masked inputs -->
<script type="text/javascript" src="scripts/jquery.masked-inputs.js"></script>
<!-- Chosen -->
<script type="text/javascript" src="scripts/jquery.chosen.js"></script>
<!-- Draggable Slider -->
<script type="text/javascript" src="scripts/jquery.slider.js"></script>
<!-- WYSIHTML5 -->
<script type="text/javascript" src="scripts/jquery.wysihtml5.js"></script>
<!-- iPhone Style Checkbox -->
<script type="text/javascript" src="scripts/jquery.iphonecheckbox.js"></script>
<!-- Minicolors -->
<script type="text/javascript" src="scripts/jquery.minicolors.js"></script>

<!-- Caffeine custom JS -->
<script type="text/javascript" src="scripts/custom.js"></script>

<!--[if IE]> <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script> <![endif]--> 
<!--[if lte IE 7]> <script src="scripts//IE8.js" type="text/javascript"></script> <![endif]--> 
<!--[if lt IE 7]> <link rel="stylesheet" type="text/css" media="all" href="css/dash/ie6.css"/> <![endif]--> 

	</head>

	<body id="index" class="home">

		<div id="loading-block"></div>
		<!-- Loading block -->

		<!-- Container -->
		<div id="container">

			<!-- Header -->
			<header id="header">

				
					
				<section id="userinfo">
					<span class="welcome">Welcome <strong><%=username%></strong>.
						
					</span> 
					<div class="profile">
						<div class="links">
							 <a href="logout.jsp"
								class="logout">Logout</a>
						</div>
						
					</div>
				</section>
				<section id="responsive-nav">
					<select id="nav_select">
						<option value="">Navigate</option>
						<option value="main.jsp">Dashboard</option>
						<option value="form-elements.html">Form Elements</option>
					</select>
				</section>
			</header>
			<!-- /Header -->

			<div class="clear"></div>
			<nav id="sidebar">
				<div class="sidebar-top"></div>

				<h3>Navigate</h3>
			
			<!-- Nav menu -->
				<ul class="nav">
					<li class="active"><a href="main.jsp">Dashboard</a></li>
					
					<li><a href="#">Students</a>
						<ul class="submenu">
							<li><a href="addstudent.jsp">Add a Student</a></li>
							<li><a href="editstudent.jsp">Edit a Student</a></li>
							<li><a href="removestudent.jsp">Remove a Student</a></li>
						</ul></li>
					<li><a href="#">Teachers</a>
						<ul class="submenu">
							<li><a href="addteacher.jsp">Add a Teacher</a></li>
							<li><a href="editteacher.jsp">Edit a teacher</a></li>
							<li><a href="removeteacher.jsp">Remove a teacher</a></li>
						</ul></li>
					<li><a href="#">People</a>
						<ul class="submenu">
							<li><a href="addperson.jsp">Add a Person</a></li>
							<li><a href="epreview.jsp">Edit a Person</a></li>
							<li><a href="removeperson.jsp">Remove Person</a></li> <li><a href="link.jsp">Link Accounts</a></li>
						</ul></li>

					<li><a href="#">Courses</a>
						<ul class="submenu">
							<li><a href="addcourse.jsp">Add a Course</a></li>
							<li><a href="editcourse.jsp">Edit a course</a></li>
							<li><a href="transfercourse.jsp">Transfer Course</a></li>
							<li><a href="removecourse.jsp">Remove course</a></li>
							<li><a href="addsubject.jsp">Add a subject</a></li>
							<li><a href="editsubject.jsp">Edit a subject</a></li>
							<li><a href="removesubject.jsp">Remove a subject</a></li>
							
						</ul></li>
					<li><a href="#">Grades</a> 
 <ul class = "submenu"> 
  <li><a href="gradepreview.jsp">Add Grades</a></li> 
  <li><a href="gradepreview1.jsp">Remove Grades</a></li> 
  </ul></li> 
  <li><a href="#">Enrollment</a>
						<ul class="submenu">
							<li><a href="enrollcourse.jsp">Enroll in Course</a></li>
							<li><a href="withdrawcourse.jsp">Withdraw from Course</a></li>
							<li><a href="schedule.jsp">Show Schedule</a></li>
						</ul></li>
					<li><a href="#">Calendar</a>
						<ul class="submenu">
							<li><a href="addcalendar.jsp">Add Calendar</a></li>
							<li><a href="removecalendar.jsp">Remove Calendar</a></li>
							<li><a href="editcalendar.jsp">Edit Calendar</a></li>
						</ul></li>
				</ul>
				<!-- /Nav menu -->

				<div class="blocks-separator"></div>
			</nav>
			<!-- Sidebar -->
			

			<div id="jgrowl" class="bottom-right"></div>

			<!-- Playground -->
			<section id="playground">
			<div class="three-fourths breadcrumb">
            	<span><a href="#" class="icon entypo home"></a></span>
                <span class="middle"></span>
                <span><a href="#">People</a></span>
                <span class="middle"></span>
                <span><a href="#">Edit a Person</a></span>
                <span class="end"></span>
            </div>
            <div class="clear"></div>
            <form name = "ap" id = "ap" method = "post" action = "PersonController.jsp">
            <div class="one-half">
            	<div class="box">
                	<div class="inner">
						
						<input type="hidden" name="type" id = "type" value="ePerson">
						<input type="hidden" name="personID" id = "personID" value="<%=personID%>">
						<input type="hidden" name="addressID" id = "addressID" value="<%=addressID%>">
                    	<div class="titlebar"><span class="icon entypo white browser"></span> <span class="w-icon">Standard Fields</span></div>
                        <div class="contents">
                        	

                            <div class="row">
                            	<label>First Name</label> <div class="field-box"><input id = "fname" name = "fname" type="text" class="large" value =  "<%=fname%>" ></div>
                                <div class="clear"></div>
                            </div>
                            
                            <div class="row">
                            	<label>Last Name</label> <div class="field-box"><input id = "lname" name = "lname" type="text" class="large" value =  "<%=lname%>"></div>
                                <div class="clear"></div>
                            </div>
                            
                            <div class="row">
                            	<label>Middle Name</label> <div class="field-box"><input id = "mname" name = "mname" type="text" class="large" value =  "<%=mname%>"></div>
                                <div class="clear"></div>
                            </div>
                            
                            <div class="row">
                            	<label>Suffix</label> <div class="field-box">
                                	<select id = "suffix" name = "suffix">
                                		<%
                                     if(suffixList != null)
                                     {
                                    	 for (int i=0; i<suffixList.size(); i++)
                                         {
                                    		 String current = suffixList.get(i);
                                    		 if(current.equals(suf))
                                    		 {
                                    			 out.println("<option value = \"" + current + "\" selected>" + current + "</option>");
                                    		 }
                                    		 else
                                    		 {
                                    			 out.println("<option value = \"" + current + "\">" + current + "</option>");
                                    		 }
                                    		
                                         
                                         } 
                                     }
                                    	%>
                                	 </select>
                                </div>
                                <div class="clear"></div>
                            </div>

                            
                            <div class="row">
                            	<label>Gender</label> <div class="field-box">
                                	<select id = "gender" name = "gender">
                                    	<%
                                     if(genderList != null)
                                     {
                                    	 for (int i=0; i<genderList.size(); i++)
                                         {
                                    		 String current = genderList.get(i);
                                    		 if(current.equals(gen))
                                    		 {
                                    			 out.println("<option value = \"" + current + "\" selected>" + current + "</option>");
                                    		 }
                                    		 else
                                    		 {
                                    			 out.println("<option value = \"" + current + "\">" + current + "</option>");
                                    		 }

                                    		
                                         
                                         } 
                                     }
                                    	%>
                                    </select>
                                </div>
                                <div class="clear"></div>
                            </div>
                       
                              <div class="row">
                                <label>Birthdate</label> 
                                <div class="field-box">
                                	
                                    <input name = "birth" id = "birth" type="text" class="validate[required, custom[date],past[2013/03/27]]" value =  "<%=birth%>">
                                </div>
                                <div class="clear"></div>
                            </div>
                            <div class="row">
                            	<label>Primary Language</label> <div class="field-box">
                                	<select id = "language" name = "language">
                                    	<%
                                     if(languageList != null)
                                     {
                                    	 for (int i=0; i<languageList.size(); i++)
                                         {
                                    		 String current = languageList.get(i);
                                    		 if(current.equals(language))
                                    		 {
                                    			 out.println("<option value = \"" + current + "\" selected>" + current + "</option>");
                                    		 }
                                    		 else
                                    		 {
                                    			 out.println("<option value = \"" + current + "\">" + current + "</option>");
                                    		 }
                                    		
                                         
                                         } 
                                     }
                                    	%>
                                    </select>
                                </div>
                                <div class="clear"></div>
                            </div>
                            
                            <div class="row">
                            	<label>Ethinicity</label> <div class="field-box">
                                	<select id = "ethinicity" name = "ethinicity">
                                    	<%
                                     if(ethinList != null)
                                     {
                                    	 for (int i=0; i<ethinList.size(); i++)
                                         {
                                    		 String current = ethinList.get(i);
                                    		 if(current.equals(ethinicity))
                                    		 {
                                    			 out.println("<option value = \"" + current + "\" selected>" + current + "</option>");
                                    		 }
                                    		 else
                                    		 {
                                    			 out.println("<option value = \"" + current + "\">" + current + "</option>");
                                    		 }
                                    		
                                         
                                         } 
                                     }
                                    	%>
                                    </select>
                                </div>
                                <div class="clear"></div>
                            </div>
                     		 
                            
                            
                        </div>
                        
						
                    </div>
                </div>
            </div>
            
            
            <div class="one-half">
				<div class="box">
					<div class="inner">
					
					<div class="titlebar">
								<span class="icon entypo white browser"></span> <span
									class="w-icon">Address</span>
							</div>
							<div class="contents">
							
								<div class="row">
									<label>House Number</label>
									<div class="field-box">
										<input id="house" name="house" type="text"
											maxlength = "10" class="large" value =  "<%=house%>">
									</div>
									<div class="clear"></div>
								</div>
								
								<div class="row">
									<label>Apartment Number</label>
									<div class="field-box">
										<input id="apt" name="apt" type="text"
											maxlength = "10" class="large" value =  "<%=apt%>">
									</div>
									<div class="clear"></div>
								</div>
								
								<div class="row">
									<label>Street</label>
									<div class="field-box">
										<input id="street" name="street" type="text" maxlength = "100" class="large" value =  "<%=street%>">
									</div>
									<div class="clear"></div>
								</div>
								
								<div class="row">
									<label>State</label>
									<div class="field-box">
										<input id="state" name="state" type="text"
											maxlength = "15" class="large" value =  "<%=state%>">
									</div>
									<div class="clear"></div>
								</div>
								
								<div class="row">
									<label>City</label>
									<div class="field-box">
										<input id="city" name="city" type="text"
											maxlength = "20" class="large" value =  "<%=city%>">
									</div>
									<div class="clear"></div>
								</div>
								
								<div class="row">
									<label>Direction</label>
									<div class="field-box">
										<input id="dir" name="dir" type="text"
											maxlength = "1" class="large" value =  "<%=direction%>">
									</div>
									<div class="clear"></div>
								</div>
								
								<div class="row">
									<label>Zip Code</label>
									<div class="field-box">
										<input id="zip" name="zip" type="text"
											maxlength = "10" class="large" value =  "<%=zip%>">
									</div>
									<div class="clear"></div>
								</div>
								
								<div class="row">
                            	<label>Country</label> <div class="field-box">
                                	<select id = "country" name = "country" data-placeholder="Your Country" style="width:350px;" class="chzn-select" tabindex="6">
                                     
                                     <%
                                     if(countryList != null)
                                     {
                                    	 for (int i=0; i<countryList.size(); i++)
                                         {
                                    		 String current = countryList.get(i);
                                    		 if(current.equals(country))
                                    		 {
                                    			 out.println("<option value = \"" + current + "\"selected>" + current + "</option>");
                                    		 }
                                    		 else
                                    		 {
                                    			 out.println("<option value = \"" + current + "\">" + current + "</option>");
                                    		 }
                                    		
                                         
                                         } 
                                     }
                                     
                                     
                                     %>

									</select>
                                        
                                   
                                </div>
                                 <div class="clear"></div>
                                </div>
								
					
					</div>
					
					</div>
				</div>
			</div>
			
			
			
			<div class="one-half">
				<div class="box">
					<div class="inner">
					
					<div class="titlebar">
								<span class="icon entypo white browser"></span> <span
									class="w-icon">Account Infomation</span>
							</div>
							<div class="contents">
								<div class="row">
									<label>User Name</label>
									<div class="field-box">
										<input id="username" name="username" type="text" class="large" value =  "<%=user%>">
									</div>
									<div class="clear"></div>
								</div>

								<div class="row">
									<label>Password</label>
									<div class="field-box">
										<input id="password1" name="password1" type="password"
											class="large">
									</div>
									<div class="clear"></div>
								</div>

								<div class="row">
									<label>Confirm Password</label>
									<div class="field-box">
										<input id="password2" name="password2" type="password"
											class="large">
									</div>
									<div class="clear"></div>
								</div>
								
					
						
					
					
					
				</div>
			</div>
			</div>
			</div>
			
			
			<div class="one-half">
				<div class="box">
					<div class="inner">
					
					<div class="titlebar">
								<span class="icon entypo white browser"></span> <span
									class="w-icon">Contact Infomation</span>
							</div>
							<div class="contents">
								<div class="row">
									<label>Phone Number</label>
									<div class="field-box">
										<input id="phone" name="phone" type="text"
											maxlength = "10" class="large" value =  "<%=phone%>">
									</div>
									
									</div>
									<div class="row">
									<label>E-Mail Address</label>
									<div class="field-box">
										<input id="email" name="email" type="text"
											maxlength = "50" class="large" value =  "<%=email%>">
									</div>
									</div>
								
					
					
					
					
					
				</div>
			</div>
			</div>
			</div>
			
			
			<div class="full-width">
				<div class="box">
					<div class="inner">
					
							<div class="contents">
							
							<div class="bar-big">
								<input type="submit" value="Submit"> <input type="reset"
									value="Reset">

							</div>
								
				</div>
			</div>
			</div>
			</div>
            
            </form>
			</section>

		</div>
		<!-- /Container -->
		
	</body>
	</html>
	<%
		} else {
			response.sendRedirect("login.jsp");
		}
	}
	%>
 
	