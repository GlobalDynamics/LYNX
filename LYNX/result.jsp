<%@ page import="account.Security" %>
<%
	if (session.getAttribute("login") == null || session.getAttribute("accountID") ==  null) {
		response.sendRedirect("login.jsp");
	} else {
		String login = (String) session.getAttribute("login");
		String username = (String) session.getAttribute("username");
		String accountID = Security.getGroupID(username);

		if (login.equals("1")) {
			
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

			<div id="jgrowl" class="bottom-right"></div>

			<!-- Playground -->
			<section id="playground">

				<!-- Breadcrumb -->
				<div class="three-fourths breadcrumb">
					<span><a href="#" class="icon entypo home"></a></span> <span
						class="middle"></span> <span>Home</span> <span class="middle"></span> <span>Result</span>
					<span class="end"></span>
				</div>
				<!-- /Breadcrumb -->
				<%
				String error =(String) session.getAttribute("error");
				if(error != null)
				{
					%>
					
					<p><%=error%></p>
					<%
					session.removeAttribute("error");
				}
				
				%>
			

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
 
	