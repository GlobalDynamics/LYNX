<%@ page import="account.Security" %>
<%@ page import="groups.PermissionsManager" %>
<%@ page import="groups.Pages" %>
<%@ page import="groups.Page" %>
<%@ page import="groups.Category" %>
<%@ page import = "java.util.List" %>
<%@ page import="groups.UserGroups" %>
<%@ page import="groups.Group" %>
<%@ page import="groups.Permission" %>
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
			String module = request.getParameter("mods");
			String group = request.getParameter("groups");
			if(group == null)
				group = "1";
			if(module == null)
				module = "1";
			
			
			
			
		
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
						class="middle"></span> <span><a href="#">Admin
							Template</a></span> <span class="middle"></span> <span>Dashboard</span>
					<span class="end"></span>
				</div>
				<!-- /Breadcrumb -->

			

				<div class="full-width">
            	<div class="box">
                	<div class="inner">
                    	<div class="titlebar"><span>Select Usergroup</span></div>
                        <div class="contents">
            			
            			<div class="row">
            				<form name = "ap" id = "ap" method = "post" action = "permissions.jsp">
            				<input type="hidden" name="mods" id = "mods" value="<%=module%>"> 
            				<select id = "groups" name = "groups" data-placeholder="Group" style="width:350px;" onchange="this.form.submit();" class="chzn-select">
            				
                                    	<%
                                    List<Group> groups = UserGroups.getAllGroups();
                                     if(groups != null)
                                     {
                                    	 for (Group value : groups) {
                                    		 if(value.name.equals("N/A"))
                                    		 	continue;
                                    		 
                                    		 if(group.equals(value.groupID))
                                    			 out.println("<option value = \"" + value.groupID + "\" selected>" + value.name + "</option>");
                                    		 else
                                    			 out.println("<option value = \"" + value.groupID + "\">" + value.name + "</option>");
                                    	 }
                                    	 
                                     }
                                    	%>
                                    </select>
                                    </form>
            			</div>
            			
            			<div class="row">
            				<form name = "ap" id = "ap" method = "post" action = "permissions.jsp">
            				<input type="hidden" name="groups" id = "groups" value="<%=group%>"> 
            				<select id = "mods" name = "mods" data-placeholder="Modules" style="width:350px;" onchange="this.form.submit();" class="chzn-select">
                                    	<%
                                    List<Category> modules = Pages.getCats();
                                     if(modules != null)
                                     {
                                    	 for (Category value : modules) {
                                    		 if(module.equals(value.alternateID))
                                    			 out.println("<option value = \"" + value.alternateID + "\" selected>" + value.alternateID + "</option>");
                                    		 else
                                    			 out.println("<option value = \"" + value.alternateID + "\">" + value.alternateID + "</option>");
                                    	 }
                                    	 
                                     }
                                    	%>
                                    </select>
                                    </form>
            			</div>
            			
            			
            			
            			
            			
            			</div>
            			</div>
            			</div>
            			</div>
            			
            	<form name = "perms" id = "perms" method = "post" action = "PermissionsController.jsp">
            	<input type="hidden" name="groups1" id = "groups1" value="<%=group%>"> 
            	  	<input type="hidden" name="type" id = "type" value="aPermission">
            	<div class="full-width">
            	<div class="box">
                	<div class="inner">
                    	
                        <div class="contents">
                        	<div class="row">
            				
            
                                    
                                    
                                    <div class="titlebar"><span class="icon awesome white table"></span> <span class="w-icon">Schedule</span></div>
	                        <table>
	                            <thead>
	                                <tr>
	                                    <th scope="col">Page</th>
	                                    <th scope="col">Read</th>
	                                    <th scope="col">Write</th>
	                                    <th scope="col">Full</th>
	                                    
	                                </tr>
	                            </thead>
	                            <tbody>
                            	 <%
                            	 List<Permission> perms = PermissionsManager.getPermissions(Integer.parseInt(group), Integer.parseInt(module));
                            	 		if(modules != null)
                                       {
                            	 			for (Permission value : perms) {
                                           {
                                        	   out.println("<tr>");
                                        	   out.println("<td>" + value.page + "</td>");
                                        	   out.println("<td><label></label> <div class=\"field-box\"><input name = \"readModule"
														+ value.moduleID
														+ "\" value = \""
														+ value.moduleID
														+ "\" type=\"checkbox\" ");
                                        	   if (value.read == 1)
                                        			out.print("checked");
                                        	   out.print("/> </div></td>");
                                 
                                        	   out.println("<td><label></label> <div class=\"field-box\"><input name = \"writeModule"
														+ value.moduleID
														+ "\" value = \""
														+ value.moduleID
														+ "\" type=\"checkbox\" ");
                                        	   if (value.write == 1)
                                       				out.print("checked ");
                                        	   out.print("/> </div></td>");
                                        	   out.println("<td><label></label> <div class=\"field-box\"><input name = \"fullModule"
														+ value.moduleID
														+ "\" value = \""
														+ value.moduleID
														+ "\" type=\"checkbox\" ");
                                        	   if (value.write == 1)
                                      				out.print("checked ");
                                       	   		out.print("/> </div></td>");

                                        	   out.println("</tr>");
                                           }
                                       }
                                       }
                                       
                                      
                                       
                                       %>
                                
                            </tbody>
                        </table>	
                                    
            			</div>
            			
            			<div class = "row">
            			<div class="bar-big">
                             <%

                                       if(modules != null)
                                       {
                                    	   
                                    	   %>
                        	<input type="submit" value="Submit">
                            <input type="reset" value="Reset">
                             <%
                                       }
                                       else
                                       {
                                    	   
                                       }
                             
                             %>
                                                         
                            </div>
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
 
	