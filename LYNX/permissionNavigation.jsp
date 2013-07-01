<%@ page import="groups.PermissionsManager" %>
<%@ page import="groups.Pages" %>
<%@ page import="groups.Page" %>
<%@ page import="groups.Category" %>
<%@ page import="java.util.List" %>
<%
				
				List<Category> categories = Pages.getCats();
				for(Category value: categories)
				{
					boolean perm = Pages.hasAccessiblePages(Integer.parseInt(value.alternateID), Integer.parseInt(accountID));
					if(perm)
					{
							if(!value.url.equals("#"))
							{
								out.println("<li><a href=\"" + value.url + "\">" + value.name+ "</a>");
								continue;
							}
								
							out.println("<li><a href=\"" + value.url + "\">" + value.name+ "</a>");
							out.println("<ul class=\"submenu\">");
						
							
						System.out.println(value.name);
						List<Page> pages = Pages.getPages(true, Integer.parseInt(value.alternateID),  Integer.parseInt(accountID));
						if(pages != null)
						{
							for(Page nextPage: pages)
							{
								
								out.println("<li><a href=\"" + nextPage.url+ "\">" + nextPage.title + "</a></li>");
								System.out.println(nextPage.name);
								
							}
						}
						out.println("</ul></li>");
						
					}		
// 					else if(value.name.contains("Dash"))
// 					{
// 						out.println("<li class=\"active\"><a href=\"main.jsp\">Dashboard</a></li>");
// 					}
					
				}
			
				
				%>