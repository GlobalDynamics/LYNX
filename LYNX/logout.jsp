<%@page import="java.util.*" %>

<%session.invalidate();

response.sendRedirect("login.jsp");

%>