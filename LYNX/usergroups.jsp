<%@ page import="account.Security" %>
<%@ page import="groups.PermissionsManager" %>
<%@ page import="groups.UserGroups" %>
<%@ page import="groups.Group" %>
<%@ page import="groups.Page" %>
<%@ page import="groups.Category" %>
<%@ page import="java.util.List" %>
<%
	if (session.getAttribute("login") == null || session.getAttribute("accountID") ==  null) {
		response.sendRedirect("login.jsp");
	} else {
		String login = (String) session.getAttribute("login");
		String username = (String) session.getAttribute("username");
		String accountID = Security.getGroupID(username);
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
	<link rel="stylesheet" href="css/dash/jquery.jgrowl.css" type="text/css" />
	<link rel="stylesheet" href="css/dash/jquery.jqplot.css" type="text/css" />
	<link rel="stylesheet" href="css/dash/icons.css" type="text/css" />
	<link rel="stylesheet" href="css/dash/forms.css" type="text/css" />
	<link rel="stylesheet" href="css/dash/tables.css" type="text/css" />
	<link rel="stylesheet" href="css/dash/ui.css" type="text/css" />
	<link rel="stylesheet" href="css/dash/style.css" type="text/css" />
	<link rel="stylesheet" href="css/dash/responsiveness.css"
		type="text/css" />

	<!-- jQuery -->
	<script src="scripts/jquery-1.8.2.js"></script>
	<script
		src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.23/jquery-ui.min.js"></script>
	<!-- jqPlot -->
	<script type="text/javascript" src="scripts/jquery.jqplot.min.js"></script>
	<script type="text/javascript"
		src="scripts/plugins/jqplot.barRenderer.min.js"></script>
	<script type="text/javascript"
		src="scripts/plugins/jqplot.highlighter.min.js"></script>
	<script type="text/javascript"
		src="scripts/plugins/jqplot.cursor.min.js"></script>
	<script type="text/javascript"
		src="scripts/plugins/jqplot.pointLabels.min.js"></script>
	<script type="text/javascript"
		src="scripts/plugins/jqplot.pieRenderer.min.js"></script>
	<script type="text/javascript"
		src="scripts/plugins/jqplot.donutRenderer.min.js"></script>
	<!-- jgrowl -->
	<script type="text/javascript" src="scripts/jquery.jgrowl.min.js"></script>
	<!-- Knob -->
	
	<!-- WYSIHTML5 -->
	<script type="text/javascript" src="scripts/jquery.wysihtml5.js"></script>
	<!-- SparkLine -->
	<script type="text/javascript" src="scripts/jquery.sparkline.js"></script>

	<script type="text/javascript" src="scripts/custom.js"></script>



	<!--[if IE]> <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script> <![endif]-->
	<!--[if lte IE 7]> <script src="scripts/IE8.js" type="text/javascript"></script> <![endif]-->
	<!--[if lt IE 7]> <link rel="stylesheet" type="text/css" media="all" href="css/ie6.css"/> <![endif]-->

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
<!-- 					<li class="active"><a href="main.jsp">Dashboard</a></li> -->
					
<!-- 					<li><a href="#">Students</a> -->
<!-- 						<ul class="submenu"> -->
<!-- 							<li><a href="addstudent.jsp">Add a Student</a></li> -->
<!-- 							<li><a href="editstudent.jsp">Edit a Student</a></li> -->
<!-- 							<li><a href="removestudent.jsp">Remove a Student</a></li> -->
<!-- 						</ul></li> -->
<!-- 					<li><a href="#">Teachers</a> -->
<!-- 						<ul class="submenu"> -->
<!-- 							<li><a href="addteacher.jsp">Add a Teacher</a></li> -->
<!-- 							<li><a href="editteacher.jsp">Edit a teacher</a></li> -->
<!-- 							<li><a href="removeteacher.jsp">Remove a teacher</a></li> -->
<!-- 						</ul></li> -->
<!-- 					<li><a href="#">People</a> -->
<!-- 						<ul class="submenu"> -->
<!-- 							<li><a href="addperson.jsp">Add a Person</a></li> -->
<!-- 							<li><a href="epreview.jsp">Edit a Person</a></li> -->
<!-- 							<li><a href="removeperson.jsp">Remove Person</a></li> <li><a href="link.jsp">Link Accounts</a></li> -->
<!-- 						</ul></li> -->

<!-- 					<li><a href="#">Courses</a> -->
<!-- 						<ul class="submenu"> -->
<!-- 							<li><a href="addcourse.jsp">Add a Course</a></li> -->
<!-- 							<li><a href="editcourse.jsp">Edit a course</a></li> -->
<!-- 							<li><a href="transfercourse.jsp">Transfer Course</a></li> -->
<!-- 							<li><a href="removecourse.jsp">Remove course</a></li> -->
<!-- 							<li><a href="addsubject.jsp">Add a subject</a></li> -->
<!-- 							<li><a href="editsubject.jsp">Edit a subject</a></li> -->
<!-- 							<li><a href="removesubject.jsp">Remove a subject</a></li> -->
							
<!-- 						</ul></li> -->
<!-- 					<li><a href="#">Grades</a>  -->
<!--  <ul class = "submenu">  -->
<!--   <li><a href="gradepreview.jsp">Add Grades</a></li>  -->
<!--   <li><a href="gradepreview1.jsp">Remove Grades</a></li>  -->
<!--   </ul></li>  -->
<!--   <li><a href="#">Enrollment</a> -->
<!-- 						<ul class="submenu"> -->
<!-- 							<li><a href="enrollcourse.jsp">Enroll in Course</a></li> -->
<!-- 							<li><a href="withdrawcourse.jsp">Withdraw from Course</a></li> -->
<!-- 							<li><a href="schedule.jsp">Show Schedule</a></li> -->
<!-- 						</ul></li> -->
<!-- 					<li><a href="#">Calendar</a> -->
<!-- 						<ul class="submenu"> -->
<!-- 							<li><a href="addcalendar.jsp">Add Calendar</a></li> -->
<!-- 							<li><a href="removecalendar.jsp">Remove Calendar</a></li> -->
<!-- 							<li><a href="editcalendar.jsp">Edit Calendar</a></li> -->
<!-- 						</ul></li> -->
				</ul>
				<!-- /Nav menu -->

				<div class="blocks-separator"></div>
			</nav>
			<!-- Sidebar -->

			<div id="jgrowl" class="bottom-right"></div>

			<!-- Playground -->
			<section id="playground">

				<!-- Breadcrumb -->
				<div class="three-fourths breadcrumb">
					<span><a href="#" class="icon entypo home"></a></span> <span
						class="middle"></span><span>Administration</span><span class="middle"></span><span>Usergroups</span>
					<span class="end"></span>
				</div>
				<!-- /Breadcrumb -->
				<form name = "rgroup" id = "rgroup" method = "post" action = "PermissionsController.jsp">
						<input type="hidden" name="type" id = "type" value="rGroup">
				<div class="full-width">
            	<div class="box">
                	<div class="inner">
                    	<div class="titlebar"><span>Add a Usergroup</span></div>
                        <div class="contents">
            			
            			 <div class="row">
								<div class="titlebar">
									<span class="icon awesome white table"></span> <span
										class="w-icon">User Groups</span>
								</div>
								<table>
									<thead>
										<tr>
											<th scope="col">Delete</th>
											<th scope="col">Name</th>
											<th scope="col">Active</th>
										</tr>
									</thead>
									<tbody>


										<%
										List<Group> groups = UserGroups.getGroups();
													

														if (groups != null) {
															for (Group value : groups) {
																out.println("<tr>");
																out.println("<td><label></label> <div class=\"field-box\"><input name = \"groupRemove"
																		+ value.groupID
																		+ "\" value = \""
																		+ value.groupID
																		+ "\" type=\"checkbox\" /> </div></td>");
																out.println("<td>" + value.name + "</td>");
																out.println("<td>" + value.active
																		+ "</td>");
																out.println("</tr>");
															}
														} else {

														}
													
										%>

									</tbody>
								</table>
								<div class="clear"></div>
							</div>
                            <div class="bar-big">
                        	<input type="submit" value="Submit">
                            <input type="reset" value="Reset">
                            
                        </div>
                            </div>
                            </div>
                            </div>
                            </div>
                            </form>
				
				
				<form name = "ap" id = "ap" method = "post" action = "PermissionsController.jsp">
						<input type="hidden" name="type" id = "type" value="aGroup">
            <div class="full-width">
            	<div class="box">
                	<div class="inner">
                    	<div class="titlebar"><span>Add a Usergroup</span></div>
                        <div class="contents">
            			
            			<div class="row">
									
										<label>New Usergroup  Name:</label>
										<div class="field-box">
											<input id="uname" name="uname" type="text" maxlength = "50" class="large">
										</div>
										<div class="clear"></div>
									</div>
                            <div class="bar-big">
                        	<input type="submit" value="Submit">
                            <input type="reset" value="Reset">
                            
                        </div>
                            </div>
                            </div>
                            </div>
                            </div>
                            </form>
			

				<div class="clear"></div>
				

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
 
	