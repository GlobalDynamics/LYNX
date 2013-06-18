<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>

<!DOCTYPE HTML>
<%@ page import="account.Login" %>
<%@ page import="lynx.Manager" %>
<%@ page import="account.CreateAccount;" %>

<%
if (session.getAttribute("login") != null)
{
	response.sendRedirect("main.jsp");
}

%>
<html>
<head>
<title>Simple Login Form</title>
<meta charset="UTF-8" />
<link href="css/login.css" rel="stylesheet" type="text/css" />
</head>

<body>

<form name = "form1" action = "verify.jsp" method = "post" class="box login">
<div id="login-box">

<H2>Login</H2>
<%

%>
<br />
<br />
<div id="login-box-name" style="margin-top:20px;">User Name:</div><div id="login-box-field" style="margin-top:20px;"><input name="Username" id = "Username" class="form-login" title="Username" value="" size="30" maxlength="2048" /></div>
<div id="login-box-name">Password:</div><div id="login-box-field"><input name="password" id = "password" type="password" class="form-login" title="Password" value="" size="30" maxlength="2048" /></div>
<br />
<br />
<input type="image" src="images/login/login-btn.png" width="103" height="42" style="margin-left:90px;" />


</div>

</form>
</body>
</html>

