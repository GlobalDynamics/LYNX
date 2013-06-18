<%@ page import="person.PersonController" %>
<%@ page import="person.Student;" %>
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
<!--[if (gte IE 9)|!(IE)]><!--><html dir="ltr" lang="en-US"> <!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;" /> 

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
	
    <div id="loading-block"></div> <!-- Loading block -->
    
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
        </header> <!-- /Header -->
        
        <div class="clear"></div>		
        
        <!-- Sidebar -->
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
			</nav> <!-- Sidebar -->

        <section id="playground">
        	
            <!-- Breadcrumb -->
            <div class="three-fourths breadcrumb">
            	<span><a href="#" class="icon entypo home"></a></span>
                <span class="middle"></span>
                <span><a href="#">Grades</a></span>
                <span class="middle"></span>
                <span><a href="#">Manage Grades</a></span>
                <span class="end"></span>
            </div>
               
            <div class="clear"></div>
            
             <form name = "ap" id = "ap" method = "post" action = "grades.jsp">
             <input type="hidden" name="type" id = "type" value="aGrade">
						
            <div class="one-half">
            	<div class="box">
                	<div class="inner">
                    	<div class="titlebar"><span>Manage Grades</span></div>
                        <div class="contents">
            			
            <div class="row">
            
            <p>Select a student to view thier grades:</p>
                            	<label>Select a student:</label> <div class="field-box">
                                	<select id = "students" name = "students" data-placeholder="No Data" style="width:350px;" class="chzn-select" tabindex="6">
                                       <%
                                       
                                      Student[] test = PersonController.getStudentsWithEnrollment();
                                       if(test != null)
                                       {
                                    	   for(Student value : test)
                                           {
                                        	   out.println("<option id = \"" + value.getStudent() + "\"  value = \"" + value.getStudent() + "\">" + value.getName() + "</option>");
                                           }
                                       }
                                       
                                       
                                      
                                       
                                       %>
                                        
                                    </select>
                                </div>
                                <div class="clear"></div>
                            </div>
                             <div class="bar-big">
                             <%

                                       if(test != null)
                                       {
                                    	   
                                    	   %>
                        	<input type="submit" value="Submit">
                            <input type="reset" value="Reset">
                             <%
                                       }
                                       
                             
                             %>
                                                         
                            </div>
                             </div>
                            </div>
                            </div>
                            </div>
                            </form>
			

           
            
        </section>    </div>
    
</body> 
</html>
	<%
		} else {
			response.sendRedirect("login.jsp");
		}
	}
	%>
 
	