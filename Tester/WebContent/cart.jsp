<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<%@ page import="java.util.*" %>
<title>Register</title>
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
	left: 110px;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Book Store</a>
    </div>
    <div>
      <ul class="nav navbar-nav">
        <li class="active"><a href="welcome.jsp">Home</a></li>
        <li><a href="/welcome.jsp">Mystery</a></li>
        <li><a href="#">Fiction</a></li>
        <li><a href="#">Non-Fiction</a></li>
        <li><a href="#">Horror</a></li>
        <li><a href="#">Adult</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#"><span class="glyphicon glyphicon-user"></span> <%=session.getAttribute("username")%></a></li>
        <li><a href="cart.jsp"><span class="glyphicon glyphicon-shopping-cart"></span> Cart</a></li>
      </ul>
    </div>
  </div>
</nav>

	<form action="cartServlet" method="post">  
        <fieldset style="width: 300px">  
            <legend>Cart</legend>  
			<table class="table table-striped">
			    <thead>
			      <tr>
			        <th>Book</th>
			        <th>Genre</th>
			        <th>Price</th>
			      </tr>
			    </thead>
			    <tbody>
			      <tr>
			        <td><p id = "demo"></p></td>
			        <td>Horror</td>
			        <td><%=session.getAttribute("username")%></td>
			        <td><%=session.getAttribute("password")%></td>
			      </tr>
			      <tr>
			        <td>Mary</td>
			        <td>Moe</td>
			        <td>mary@example.com</td>
			      </tr>
			      <tr>
			        <td>July</td>
			        <td>Dooley</td>
			        <td>july@example.com</td>
			      </tr>
			    </tbody>
			  </table>
       	</fieldset>
   	</form>
   	<form action="CartServlet" method="post"> 
    	<fieldset style="width: 300px"> 
	    		<input type="radio" name="book" value="john">Female</input>
	            	<div class="container">
					  			<input type="submit" class="btn btn-link btn-md" value = "Buy"></input>
					</div>
		</fieldset>
	</form>
   	<script type="text/javascript">
		var book = "Matterhorn";
		var cart = "<%=session.getAttribute("cart")%>";
		var array = cart.split(" ");
		//array.splice(0, 2);
		
		document.getElementById("demo").innerHTML = array;
	</script>
  	 
</body>
</html>
