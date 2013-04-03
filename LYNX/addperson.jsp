
<%
	if (session.getAttribute("login") == null) {
		response.sendRedirect("login.jsp");
	} else {
		String login = (String) session.getAttribute("login");

		if (login.equals("1")) {
			String username = (String) session.getAttribute("username");
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
		<link rel="stylesheet" href="css/dash/validationEngine.jquery.css" type="text/css"/>
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
<script type="text/javascript" src="js/jquery.mousewheel.min.js"></script>
<script type="text/javascript" src="js/jquery.ui.spinner.js"></script>
<!-- jqPlot -->
<script type="text/javascript" src="js/jquery.jqplot.min.js"></script>
<script type="text/javascript" src="js/plugins/jqplot.barRenderer.min.js"></script>
<script type="text/javascript" src="js/plugins/jqplot.highlighter.min.js"></script>
<script type="text/javascript" src="js/plugins/jqplot.cursor.min.js"></script> 
<script type="text/javascript" src="js/plugins/jqplot.pointLabels.min.js"></script>
<script type="text/javascript" src="js/plugins/jqplot.pieRenderer.min.js"></script> 
<script type="text/javascript" src="js/plugins/jqplot.donutRenderer.min.js"></script>
<!-- Full Calendar -->
<script type='text/javascript' src='js/fullcalendar/fullcalendar.min.js'></script>
<!-- Plupload -->
<script type="text/javascript" src="js/plupload.js"></script>
<script type="text/javascript" src="js/plupload.html4.js"></script>
<script type="text/javascript" src="js/plupload.html5.js"></script>
<script type="text/javascript" src="js/jquery.plupload.queue.js"></script>
<!-- Validation engine -->
<script type="text/javascript" src="js/languages/jquery.validationEngine-en.js" charset="utf-8"></script>
<script type="text/javascript" src="js/jquery.validationEngine.js"></script>
<!-- jgrowl -->
<script type="text/javascript" src="js/jquery.jgrowl.min.js"></script>
<!-- scrollTo -->
<script type="text/javascript" src="js/jquery.scrollto.js"></script>
<!-- Knob -->
<script type="text/javascript" src="js/jquery.knob.js"></script>
<!-- Masked inputs -->
<script type="text/javascript" src="js/jquery.masked-inputs.js"></script>
<!-- Chosen -->
<script type="text/javascript" src="js/jquery.chosen.js"></script>
<!-- Draggable Slider -->
<script type="text/javascript" src="js/jquery.slider.js"></script>
<!-- WYSIHTML5 -->
<script type="text/javascript" src="js/jquery.wysihtml5.js"></script>
<!-- iPhone Style Checkbox -->
<script type="text/javascript" src="js/jquery.iphonecheckbox.js"></script>
<!-- Minicolors -->
<script type="text/javascript" src="js/jquery.minicolors.js"></script>

	<script type="text/javascript" src="scripts/custom.js"></script>
	<script type="text/javascript">
	jQuery(document).ready(function() {
		// Form validate
		jQuery("#ap").validationEngine();
	});
</script>



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
							<li><a href="removeperson.jsp">Remove Person</a></li>
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
							<li><a href="gradepreview.jsp">Manage Grades</a></li>
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
                <span><a href="#">Add a Person</a></span>
                <span class="end"></span>
            </div>
            <div class="clear"></div>
            
            <div class="one-half">
            	<div class="box">
                	<div class="inner">
						<form name = "ap" id = "ap" method = "post" action = "PersonController.jsp">
						<input type="hidden" name="type" id = "type" value="aPerson">
                    	<div class="titlebar"><span class="icon entypo white browser"></span> <span class="w-icon">Standard Fields</span></div>
                        <div class="contents">
                        	

                            <div class="row">
                            	<label>First Name</label> <div class="field-box"><input id = "fname" name = "fname" type="text" class="large"></div>
                                <div class="clear"></div>
                            </div>
                            
                            <div class="row">
                            	<label>Last Name</label> <div class="field-box"><input id = "lname" name = "lname" type="text" class="large"></div>
                                <div class="clear"></div>
                            </div>
                            
                            <div class="row">
                            	<label>Middle Name</label> <div class="field-box"><input id = "mname" name = "mname" type="text" class="large"></div>
                                <div class="clear"></div>
                            </div>
                            
                            
                            <div class="row">
                            	<label>Suffix</label> <div class="field-box"><input id = "suffix" name = "suffix" type="text" class="tiny"> </div>
                                <div class="clear"></div>
                            </div>
                            
                            <div class="row">
                            	<label>Gender</label> <div class="field-box"><input id = "gender" name = "gender" type="text" class="tiny"> </div>
                                <div class="clear"></div>
                            </div>
                       
                              <div class="row">
                                <label>Birthdate</label> 
                                <div class="field-box">
                                	<span class="icon entypo calendar for-input"></span>
                                    <input name = "birth" id = "birth" type="text" class="w-icon medium validate[required, custom[date],past[2013/03/27]]">
                                </div>
                                <div class="clear"></div>
                            </div>
                            
                            <div class="row">
                            	<label>User Name</label> <div class="field-box"><input id = "username" name = "username" type="text" class="large"></div>
                                <div class="clear"></div>
                            </div>
                            
                             <div class="row">
                            	<label>Password</label> <div class="field-box"><input id = "password1" name = "password1" type="text" class="large"></div>
                                <div class="clear"></div>
                            </div>
                            
                            <div class="row">
                            	<label>Confirm Password</label> <div class="field-box"><input id = "password2" name = "password2" type="text" class="large"></div>
                                <div class="clear"></div>
                            </div>
                            
                        </div>
                        <div class="bar-big">
                        	<input type="submit" value="Submit">
                            <input type="reset" value="Reset">
                            
                        </div>
						</form>
                    </div>
                </div>
            </div>

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
 
	