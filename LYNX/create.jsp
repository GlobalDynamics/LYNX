<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ page import="account.CreateAccount;" %>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<title>Create Account</title>
	<meta charset="UTF-8" />
	<link rel="stylesheet" type="text/css" href="css/reset.css" />
	<link rel="stylesheet" type="text/css" href="css/structure.css" />
</head>

<body>
<div class="box login">
<fieldset class="boxBody">
<form name = "form1" action = "verify.jsp" method = "post">
<label for="Username">User Name:</label><input type="text" name="Username" id="Username" value="User name" />
<label for="password1">Password</label><input type="text" name="password1" id="password1" value="password" />
<label for="password2">Password:</label><input type="text" name="password2" id="password2" value="password" />
<input type="submit" >
</form>
</fieldset>

</div>
</body>
</html>
