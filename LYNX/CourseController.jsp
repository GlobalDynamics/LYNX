<%@ page import="account.Login" %>
<%@ page import="course.CourseController" %>
<%@ page import="course.Grade" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Iterator" %>
<%
	if (session.getAttribute("login") == null) {
		response.sendRedirect("login.jsp");
	} else {
		String login = (String) session.getAttribute("login");
		String fname = null; 
		String lname = null; 
		if (login.equals("1")) {
			if(request.getParameter("type") != null)
			{
				if(((String) request.getParameter("type")).equals("aSubject"))
				{
					String name = (String) request.getParameter("sname");
					int calendarID = Integer.parseInt(request.getParameter("calendars"));
					if(CourseController.validateSubject(name.length()) ==1)
					{
						CourseController.addSubject(name,calendarID);
						response.sendRedirect("addsubject.jsp");
					}
					else
					{
						session.setAttribute("error", "Invalid data was entered.");
						response.sendRedirect("result.jsp");
					}
				}
				else if(((String) request.getParameter("type")).equals("rSubject"))
				{
					int subjectID = Integer.parseInt(request.getParameter("subjects"));
					CourseController.removeSubject(subjectID);
					response.sendRedirect("removesubject.jsp");
				}
				
				else if(((String) request.getParameter("type")).equals("eSubject"))
				{
					int subjectID = Integer.parseInt(request.getParameter("subjects"));
					String name = (String) request.getParameter("sname");
					
					if(CourseController.validateSubject(name.length()) ==1)
					{
						CourseController.editSubject(subjectID,name);
						response.sendRedirect("editsubject.jsp");
					}
					else
					{
						session.setAttribute("error", "Invalid data was entered.");
						response.sendRedirect("result.jsp");
					}
				}
				
				else if(((String) request.getParameter("type")).equals("aCourse"))
				{
					
					int subjectID = Integer.parseInt(request.getParameter("subjects"));
					int teacherID = Integer.parseInt(request.getParameter("teachers"));
					int calendarID = Integer.parseInt(request.getParameter("calendars"));
					String name = (String) request.getParameter("cname");
					String sname = (String) request.getParameter("sname");
					if(CourseController.validateCourseDate(name.length(), sname.length()) == 1)
					{
						CourseController.createCourse(name,sname,subjectID,teacherID, calendarID);
						response.sendRedirect("addcourse.jsp");
					}
					else
					{
						session.setAttribute("error", "Invalid data was entered.");
						response.sendRedirect("result.jsp");
					}
					
				}
				
				else if(((String) request.getParameter("type")).equals("rCourse"))
				{
					//int courseID = Integer.parseInt(request.getParameter("courses"));
					//CourseController.removeCourse(courseID);
					//response.sendRedirect("removecourse.jsp");
					Map parms = request.getParameterMap();  
					
					for (Iterator iterator = parms.entrySet().iterator(); iterator.hasNext();)  {  
					    Map.Entry entry = (Map.Entry) iterator.next();  
					    System.out.println("parameter name:"+entry.getKey());  
					    System.out.println("value:"+request.getParameter(entry.getKey().toString())); 
					    if(entry.getKey().toString().contains("courseRemove"))
					    {
					    	int courseID = Integer.parseInt(request.getParameter(entry.getKey().toString()));
					    	CourseController.removeCourse(courseID);
							
					    }
				    }  
					response.sendRedirect("removecourse.jsp");
					
					
				}
				
				else if(((String) request.getParameter("type")).equals("eCourse"))
				{
					int courseID = Integer.parseInt(request.getParameter("courses"));
					int subjectID = Integer.parseInt(request.getParameter("subjects"));
					int teacherID = Integer.parseInt(request.getParameter("teachers"));
					int calendarID = Integer.parseInt(request.getParameter("calendars"));
					String name = (String) request.getParameter("cname");
					String sname = (String) request.getParameter("sname");
					CourseController.editCourse(courseID,name,sname,subjectID,teacherID,calendarID);
					response.sendRedirect("editcourse.jsp");
					
					if(CourseController.validateCourseDate(name.length(), sname.length()) == 1)
					{
						CourseController.editCourse(courseID,name,sname,subjectID,teacherID,calendarID);
						response.sendRedirect("addcourse.jsp");
					}
					else
					{
						session.setAttribute("error", "Invalid data was entered.");
						response.sendRedirect("result.jsp");
					}
				}
				
				else if(((String) request.getParameter("type")).equals("aGrade"))
				{
					int enrollmentID = Integer.parseInt(request.getParameter("enroll"));
					String grade = (String) request.getParameter("grade");
					if(CourseController.validateGrade(grade.length()) == 1)
					{
						Grade.addGrade(enrollmentID,grade);
						session.setAttribute("enroll",null);
						response.sendRedirect("gradepreview.jsp");
					}
					else
					{
						session.setAttribute("error", "Invalid data was entered.");
						response.sendRedirect("result.jsp");
					}
					
				}
				
				else if(((String) request.getParameter("type")).equals("rGrade"))
				{
					int gradeID = Integer.parseInt(request.getParameter("courses"));
					Grade.removeGrade(gradeID);
					response.sendRedirect("gradepreview1.jsp");
				}
				
				else if(((String) request.getParameter("type")).equals("tCourse"))
				{
					int nextCalendar = -1;
					 Map parms = request.getParameterMap();  
					if((String) request.getParameter("nextCalendar") != null)
					{
						nextCalendar = Integer.parseInt(request.getParameter("nextCalendar"));
						for (Iterator iterator = parms.entrySet().iterator(); iterator.hasNext();)  {  
						    Map.Entry entry = (Map.Entry) iterator.next();  
						    System.out.println("parameter name:"+entry.getKey());  
						    System.out.println("value:"+request.getParameter(entry.getKey().toString())); 
						    int subjectTransfer = Integer.parseInt(request.getParameter("subjects"));
						    String duplicate = request.getParameter("duplicate");
						    if(entry.getKey().toString().contains("courseRemove"))
						    {
						    	if(duplicate != null)
						    	{
						    		CourseController.transferCourse(Integer.parseInt(request.getParameter(entry.getKey().toString())), nextCalendar, subjectTransfer, true);
						    	}
						    	else
						    	{
						    		CourseController.transferCourse(Integer.parseInt(request.getParameter(entry.getKey().toString())), nextCalendar, subjectTransfer, false);
						    	}
						    	
						    	
						    }
					    }  
						response.sendRedirect("transfercourse.jsp");
					}
				   
				    
				}
				
				
			}
			
			
					
			
			
			
			
			
			
		} else {
			response.sendRedirect("login.jsp");
		}
	}
	%>