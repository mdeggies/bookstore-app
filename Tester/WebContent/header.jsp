<%@ page import="java.io.*,java.util.*" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- If someone is trying to get to welcome.jsp without being logged in,
redirect them to login page -->
<%  
     if (session.getAttribute("username") == null) {  
    	    String redirectURL = "http://localhost:8080/Tester/login.jsp";
    	    response.sendRedirect(redirectURL);
     }
  %>
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<title>Home</title>
<style type="text/css">
body {
	background-color: "white";
	background-attachment: fixed;
}
</style>
<script>
	$(function(){
		var url = window.location.href.split("/");
		var action = url[url.length-1]
		$(".navbar-nav li a[href='"+action+"']").parent().addClass("active")
	})
</script>
<title>Welcome <%=session.getAttribute("username")%></title>
</head>
<body>   
	<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Book Store</a>
    </div>
    <div>
      <ul class="nav navbar-nav">
        <li><a href="welcome.jsp">Home</a></li>
        <li><a href="mystery.jsp">Mystery</a></li>
        <li><a href="fiction.jsp">Fiction</a></li>
        <li><a href="nonfiction.jsp">Non-Fiction</a></li>
        <li><a href="horror.jsp">Horror</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="account.jsp"><span class="glyphicon glyphicon-user"></span> <%=session.getAttribute("username")%></a></li>
        <li><a href="cart.jsp"><span class="glyphicon glyphicon-shopping-cart"></span> Cart</a></li>
      </ul>
    </div>
  </div>
</nav>



<div class="container" style="width:200;height:auto">