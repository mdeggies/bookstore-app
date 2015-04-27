<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<style type="text/css">
body {
	background-color: "white";
	background-attachment: fixed;
}

div.bord
{
	top: 200px;
	width: 400px;
	padding: 10px;
	border: 10px groove #069;

	border-radius: 15px;
	height: auto;
	background-color: rgba(184,194,200,0.7);
	
}
div.pos
{
	position: relative;
	left: 50px;
}
</style>
<title>Login</title>
</head>
<body>
<table align = "left">
<div class="container">
  <h2>Login</h2>
  <form method = "post" action = "loginServlet" role="form">
    <div class="form-group" action = "login">
      <label for="username">Username:</label>
      <input type="text" class="form-control" id="username" name = "username" placeholder="Enter email">
    </div>
    <div class="form-group">
      <label for="password">Password:</label>
      <input type="password" class="form-control" id="password" name = "password" placeholder="Enter password">
    </div>
    <div class="checkbox">
      <label><input type="checkbox"> Remember me</label>
    </div>
    <button type="submit" class="btn btn-default" value = "Login">Submit</button>
    If you are a new user, please <a href="register.jsp">register</a>.
  </form>
</div>
</table>
</body>
</html>
