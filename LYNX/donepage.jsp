
<%
	if (session.getAttribute("login") == null) {
		response.sendRedirect("login.jsp");
	} else {
		String login = (String) session.getAttribute("login");

		if (login.equals("1")) {
			String username = (String) session.getAttribute("username");
			String message = (String) session.getAttribute("value");
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
	<script type="text/javascript" src="scripts/jquery.knob.js"></script>
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
			
			<!-- Sidebar -->
			<ul class="nav">
					<li class="active"><a href="main.jsp">Dashboard</a></li>
					<li><a href="tables.html">Tables &amp; Charts</a></li>
					<li><a href="#">Students</a>
						<ul class="submenu">
							<li><a href="form-elements.html">Add a Student</a></li>
							<li><a href="editstudent.jsp">Edit a Student</a></li>
							<li><a href="editstudent.jsp">Remove a Student</a></li>
						</ul></li>
					<li><a href="#">People</a>
						<ul class="submenu">
							<li><a href="addperson.jsp">Add a Person</a></li>
							<li><a href="epreview.jsp">Edit a Person</a></li>
							<li><a href="removeperson.jsp">Remove Person</a></li>
						</ul></li>

					<li><a href="#">Courses</a>
						<ul class="submenu">
							<li><a href="ui.html">Add a Course</a></li>
							<li><a href="editstudent.jsp">Edit a course</a></li>
							<li><a href="calendar.html">Transfer Course</a></li>
							<li><a href="file-upload.html">Remove course</a></li>
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
            	<h3><%=message%></h3>
            </div>


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
 
	