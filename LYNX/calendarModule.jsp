<%@ page import="schedule.CalendarController" %>
<%@ page import="schedule.Calendar" %>
  <%
 
                                       if(calendars != null)
                                       {
                                    	   for(Calendar value : calendars)
                                           {
                                    		   if(calendarID != null)
                                    		   {
                                    			   if(value.getID().equals(calendarID))
                                        		   {
                                        			   out.println("<option id = \"" + value.getID() + "\"  value = \"" + value.getID() + "\" selected>" + value.getName() + "</option>");
                                        		   }
                                        		   else
                                        		   {
                                        			   out.println("<option id = \"" + value.getID() + "\"  value = \"" + value.getID() + "\">" + value.getName() + "</option>");
                                        		   }  
                                    		   }
                                    		   else
                                    		   {
                                    			   out.println("<option id = \"" + value.getID() + "\"  value = \"" + value.getID() + "\">" + value.getName() + "</option>");
                                    		   }
                                    		  
                                        	   
                                           }
                                    	   if(calendars.length ==1 || (calendars != null && calendarID == null))
                                           {
                                        	   calendarID = calendars[0].getID();
                                           }
                                       }
                                       else
                                       {
                                    	  
                                       }
                                       
                                       %>