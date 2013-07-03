<%@ page import="account.Security" %>
<%@ page import="person.PersonController" %>
<%@ page import="course.CourseController" %>
<%@ page import="person.Student" %>
<%@ page import="person.Person" %>
<%@ page import="schedule.Calendar" %>
<%@ page import="schedule.CalendarController" %>
<%@ page import="course.Subject" %>
<%@ page import="course.Course" %>
<%
	if (session.getAttribute("login") == null || session.getAttribute("accountID") ==  null) {
		response.sendRedirect("login.jsp");
	} else {
		String login = (String) session.getAttribute("login");
		String username = (String) session.getAttribute("username");
		String accountID = Security.getGroupID(username);
		String calendarID = null;
		String subjectID = null;
		String uri = request.getRequestURI();

		String pageName = uri.substring(uri.lastIndexOf("/")+1);

		boolean permission = PermissionsManager.checkPermission(Integer.parseInt(accountID), pageName, "read");
		if (login.equals("1")) {
			if(!permission)
			{
				session.setAttribute("error", "You do not have permission to access this page.");
				response.sendRedirect("result.jsp");
				return;
				
			}
			
			if((String) request.getParameter("calendars") == null)
					{
						//response.sendRedirect("addcourse1.jsp");
					}
			else
			{
				calendarID = (String) request.getParameter("calendars");
			}
			if((String) request.getParameter("subjects") != null)
			{
				subjectID = (String) request.getParameter("subjects");
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

<link rel="stylesheet"
	href="css/dash/ui-lightness/jquery-ui-1.8.18.custom.css"
	type="text/css" media="screen" />
<link rel="stylesheet" href="css/dash/validationEngine.jquery.css"
	type="text/css" />
<link rel="stylesheet" href="css/dash/icons.css" type="text/css" />
<link rel="stylesheet" href="css/dash/forms.css" type="text/css" />
<link rel="stylesheet" href="css/dash/tables.css" type="text/css" />
<link rel="stylesheet" href="css/dash/ui.css" type="text/css" />
<link rel="stylesheet" href="css/dash/style.css" type="text/css" />
<link rel="stylesheet" href="css/dash/responsiveness.css"
	type="text/css" />

<!-- jQuery -->
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.23/jquery-ui.min.js"></script>
<!-- Spinner -->
<script type="text/javascript" src="scripts/jquery.mousewheel.min.js"></script>
<script type="text/javascript" src="scripts/jquery.ui.spinner.js"></script>
<!-- Validation engine -->
<script type="text/javascript"
	src="scripts/languages/jquery.validationEngine-en.js" charset="utf-8"></script>
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
							
							<br>
								<form name = "ap" id = "ap" method = "post" action = "enrollcourse.jsp">
								<div class="field-box">
								<select id = "calendars" name = "calendars" data-placeholder="No Data" onchange="this.form.submit();" style="width:350px;" class="chzn-select" tabindex="6">
                                       <%
                                       Calendar[] calendars = CalendarController.getCalendars();
                                       %>
                                       <%@ include file="calendarModule.jsp" %>
                                        
                                    </select>
                                    </div>
                                    </form>
					</div>
					
				</div>
			</section>
		</header>
		<!-- /Header -->

		<div class="clear"></div>

		<!-- Sidebar -->
		<nav id="sidebar">
			<div class="sidebar-top"></div>

			<h3>Navigate</h3>

			<!-- Nav menu -->
			<ul class="nav">
				<%@ include file="permissionNavigation.jsp" %>
			</ul>
			<!-- /Nav menu -->

			<div class="blocks-separator"></div>
		</nav>
		<!-- Sidebar -->

		<section id="playground">

			<!-- Breadcrumb -->
			<div class="three-fourths breadcrumb">
				<span><a href="#" class="icon entypo home"></a></span> <span
					class="middle"></span> <span>Enrollment</span> <span
					class="middle"></span> <span><a href="#">Enroll a
						Student</a></span> <span class="end"></span>
			</div>

			<div class="clear"></div>

			
				<div class="one-half">
					<div class="box">
						<div class="inner">
							<div class="titlebar">
								<span>Add Courses</span>
							</div>
							<div class="contents">

								
								
								<form name = "subject" id = "subject" method = "post" action = "enrollcourse.jsp">
								<input type="hidden" name="calendars" id = "calendars" value="<%=calendarID%>">
								
								 <div class="row">

									<p>Select a subject for the course</p>
									<label>Select a subject for the course</label>
									<div class="field-box">
										<select id="subjects" name="subjects"
											data-placeholder="No Data" style="width: 350px;"
											class="chzn-select" onchange="this.form.submit();" tabindex="6">
											<%
												Subject[] test1 = null;
												if(calendarID != null)
												{
													test1 = CourseController.getSubjects(Integer.parseInt(calendarID));
													if (test1 != null) {
														for (Subject value : test1) {
															
															if(subjectID != null)
															{
																if(value.getSubject().equals(subjectID))
																{
																	out.println("<option id = \"" + value.getSubject()
																			+ "\"  value = \"" + value.getSubject()
																			+ "\"selected>" + value.getName() + "</option>");
																}
																else
																{
																	out.println("<option id = \"" + value.getSubject()
																			+ "\"  value = \"" + value.getSubject()
																			+ "\">" + value.getName() + "</option>");
																}
															}
															else
															{
																out.println("<option id = \"" + value.getSubject()
																		+ "\"  value = \"" + value.getSubject()
																		+ "\">" + value.getName() + "</option>");
															}
															
															
														}
														if(test1.length ==1 || (test1 != null && subjectID == null))
				                                           {
				                                        	   subjectID = test1[0].getSubject();
				                                           }
													} else {
														
													}
												}
												
											%>

										</select>

										<div class="clear"></div>
									</div>
									</div>
									</form>
								
								<form name = "course" id = "course" method = "post" action = "EnrollmentController.jsp">
								<input type="hidden" name="calendars" id = "calendars" value="<%=calendarID%>">
								<input type="hidden" name="subjects" id = "subjects" value="<%=subjectID%>">
								<div class="row">

									<p>Select a course to enroll the student in</p>
									<label>Select a course:</label>
									<div class="field-box">
										<select id="courses" name="courses" data-placeholder="No Data"
											style="width: 350px;" class="chzn-select" tabindex="6">
											<%
											Course[] test2 = null;
											if(subjectID != null && calendarID != null)
											{
												test2 = CourseController.getCoursesBySubject(Integer.parseInt(subjectID));
												if (test2 != null) {
													for (Course value : test2) {
														out.println("<option id = \"" + value.getCourse()
																+ "\"  value = \"" + value.getCourse()
																+ "\">" + value.getName()  + "</option>");
													}
													
												
													
												} else {

												}
											}
														
											%>

										</select>
									</div>
									<div class="clear"></div>
								</div>
								
								<div class="row">
									<p>Select a student to add a course to</p>
									<label>Select a student:</label>
									<div class="field-box">
										<select id="students" name="students"
											data-placeholder="No Data" style="width: 350px;"
											class="chzn-select" tabindex="6">
											<%
												Student[] test = PersonController.getStudents();
														if (test != null) {
															for (Student value : test) {
																out.println("<option id = \"" + value.getStudent()
																		+ "\"  value = \"" + value.getStudent()
																		+ "\">" + value.getName() + "</option>");
															}
														} 
											%>

										</select>
									</div>

									<div class="clear"></div>
								</div>
								

								<div class="bar-big">
								<%
									if (test != null && test2 != null) {
								%>
								
				<input type="hidden" name="type" id="type" value="aEnroll">
				<input type="hidden" name="calendars" id = "calendars" value="<%=calendarID%>">
				<input type="hidden" name="subjects" id = "subjects" value="<%=subjectID%>">
								<input type="submit" value="Submit"> <input type="reset"
									value="Reset">
									
								<%
									} else {

											}
								%>

							</div>
							</form>
							</div>
							
						</div>
					</div>
				</div>
			




		</section>
	</div>

</body>
</html>
<%
	} else {
			response.sendRedirect("login.jsp");
		}
	}
%>

